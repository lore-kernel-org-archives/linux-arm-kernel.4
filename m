Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E5606A884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doUW+WK0;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BShmhzl9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gRcRRaZ0zBHR6AzzngEkus5puXdP7+q6G0foB4y3g6M=; b=doUW+WK0th/25Xs3hdVxh1NmHG
	R3TqcqxYJXfVpvGHUTAVrbc7Au7Qd8dB5KlLbGvwskoT3BJBABOIt+LbQLOcarOiUd3b7j9HCYONT
	MOr+7wGSuwEbyAH+wqLNfu44seRpPsUNxBklolLaz2yt2NQ4orMOdC7hT3rc928PBUmXZTNR+6Bgd
	fI4B8VSjukQqYGj4kLIhOSVIBbcmjyTJEyPbLMqGboE/9q8pSPyXjPJpg1TLyn/zs6q0OSTbKvM7R
	to++I4ZiNWLol+DS8I3z4Ou8XW1hm3VvPKsKVPpgNWPpuo1lRp3k6GkaBf9q5iYtjPuMG4MrxQWoB
	yrGMVDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxJx-0000000EIH6-0tkg;
	Fri, 13 Nov 2026 19:52:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxJu-0000000EIFp-37Rn;
	Fri, 13 Nov 2026 19:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gRcRRaZ0zBHR6AzzngEkus5puXdP7+q6G0foB4y3g6M=; b=BShmhzl9dtAhEXDTPI+MxqFOmI
	ymDsimlTtgfmpYEY77qbIna11D3R9X0ady2NKvpRJHx7EqkRD1WjlbPeN56FoZB4UKqyoDdkRwyGc
	LWN/mOZpHlON6O5VlpmLsmk/sSO2grns3NwCpBoXkKhR5ztd9236ugXebx/59fDl9j9hifB2EaUE4
	aOnrlfwGmm/2YTXQV2RBpJLsHZReDd1Rp6xLNH/J/VINijLSGVLYXuVaM5v+zSqt9UsEZUEMCY8ww
	kuBD+yHdFL4b6KsbCXnA9UAl3NEmSAw8bQCOC/L3Vt2bYxjSgwHNq9g72qY7JiO0RFi3Xz11SnyP+
	ISjIkexA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip: inno-hdmi: Fix potential stale clock provider
Date: Fri, 13 Nov 2026 20:52:15 +0100
Message-ID: <lm0TpB3cRZ6mCNfPP6bL8A@sntech.de>
In-Reply-To: <20261110-9f141e6bc8-phy-rockchip@mail.sdu.edu.cn>
References: <20261110-9f141e6bc8-phy-rockchip@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_115222_781057_FFBBA1DD 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 10. November 2026, 15:32:25 Mitteleurop=C3=A4ische Normalzeit =
schrieb Guangshuo Li:
> The clock provider remains registered if PHY provider registration fails.
> Device-managed cleanup then frees the clock hardware and PHY private
> data still referenced by the provider.
>=20
> Use a device-managed clock provider so both probe failure and removal
> unregister it before the clock hardware is released.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 53706a116863 ("phy: add Rockchip Innosilicon hdmi phy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



