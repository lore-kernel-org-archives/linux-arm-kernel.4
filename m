Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8D1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+nzlZpe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XibOEBQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=; b=d+nzlZpehdfb9n
	Oi4em/dwT/lwe+vbCFllcjKnLu0DQOSyh6ItsOJiTjxaIQhtSFjC7vy4b+KdPfLHjeFZz797VfD6z
	hP1ty5G/g84FBB7jtrhK53jVX+rMNiHFxBO/WXTYfayyY8/eHfnoFmgbapmsFLNurqXQTaLQrmbpN
	JP1bTCOixiQ8RB4aupqcG3Q/CyTb7O7DxFQdF7mBaY55rQf7eduAUlNtcpOhQqM8hK7xjl2FOsCe7
	FaEpVCJO6mi0e9kSeTu4ydG4LaKSXb0plJTPM+Hw/m305w/+hxefcSwJg1BTrsLTkbMzE4Cy0KcGc
	MNQ/X1/V0dPsLOMQXc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEMt-00000004rS0-2Lbw;
	Tue, 17 Nov 2026 08:16:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEMq-00000004rRB-2zsF;
	Tue, 17 Nov 2026 08:16:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794903392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nVi1itKM2VEMnfTFsm/6uPeY1mwe6+SgpzO1nnkwknXBj1m0bcDW5rwKJDrOhfY6+fGn0p7xMO36NH045ZEg5UDIusqHNU8OMuPV8633d+TIyiXbFHj8mjrbnHGU/MzBcY0qfadmsWeJiz8Gg0hxhuxyo9DwV5/erhdRNMp6Fmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794903392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=; 
	b=SDg0jEKjhSzX29+MrdRkaNEHTk90tOx7qyosAeD+xyTx3YUga255xDZ1QCzNvhUtmtbkZI/3bVrE3AwyUUxR/5Kf2eppIE/1oKD8bF2h1GCW/UP/m7L+5aPH4qJ7Paioxo6c4GE+K3ZnNxIj656wbwH6PStc+rcP56oHbXF+XLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=XibOEBQhIAomoBWVCSW4lGsxqc8bKaXJLXreKl1su0qOdrtW7br+Oi+0p4NR8/U4EU6vSOKHo/JTbF2bJNMwKcdXfm8Uaea4TXs1bTp2aP2XRZpWHyqHkKvI2pFyqjHU0srAWiQkJE8DNMMN+2UvejdwRF55ZX15e47+KpASH1Q=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179490338955423.03246426210353;
	Tue, 17 Nov 2026 00:16:29 -0800 (PST)
Message-ID: <d3e91164-9da9-4f20-9165-5a586d9aa55b@collabora.com>
Date: Tue, 17 Nov 2026 09:16:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
 <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
 <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
 <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_001640_832202_063F5242 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On 11/17/26 07:41, 楊智成 wrote:
> Hi Michael,
> 
> On 11/16/26 11:00, Michael Riesch wrote:
>> Still what we discussed makes sense, so let us do some refactoring in a
>> later series.
> 
> As discussed, I plan to add the tx_ prefix to the PLL helpers in 6/9.

Oh, seems I missed that. OK, carry on :-)

> I also noticed that struct samsung_mipi_phy holds phy and lanes, which
> TX and RX both use, but also the RX-only hs* fields added in 8/9, while
> the TX-only PLL state stays in struct samsung_mipi_dcphy.
> 
> I am thinking about the following:
> 
> 1) One struct per direction:
> 
> struct samsung_mipi_phy_tx {
>   struct phy *phy;
>   unsigned int lanes;
>   struct reset_control *m_phy_rst;
>   bool legacy_mismatch;
>   struct { ... } pll;
> };
> 
> struct samsung_mipi_phy_rx {
>   struct phy *phy;
>   unsigned int lanes;
>   struct reset_control *s_phy_rst;
>   unsigned long long hs_clk_rate;
>   u16 hsfreq_cfg;
> };
> 
> 2) Keep only phy and lanes in struct samsung_mipi_phy, and move the hs*
> fields to struct samsung_mipi_dcphy, next to the PLL state:
> 
> struct samsung_mipi_dcphy {
>   ...
>   struct samsung_mipi_phy tx;
>   struct samsung_mipi_phy rx;
>   ...
>   struct { ... } pll;
>   unsigned long long rx_hs_clk_rate;
>   u16 rx_hsfreq_cfg;
> };
> 
> Option 1 changes 6/9 to 8/9, option 2 only 8/9. Which one would be more
> convenient for your future work?

Thank you for asking. Option 1 seems a tad cleaner to me.

Please note that there could be a variation of option 1, something like

struct samsung_mipi_dcphy {
  ...
  struct samsung_mipi_phy tx;
  struct samsung_mipi_phy rx;
  ....
};

where

struct samsung_mipi_phy {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *phy_rst;
  union {
     struct {
       unsigned long long hs_clk_rate;
       u16 hsfreq_cfg;
     } rx_stuff;
     struct {
       bool legacy_mismatch;
       struct { ... } pll;
     } tx_stuff;
  };
};

Maybe this is an acceptable approach for you?

Best regards,
Michael


