Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8728606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Js+CpY0Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQwQqMet
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=; b=Js+CpY0QY9oa83
	BtMsfRyTXe3oAs+VlG149bAI9XU3/U+GPlLCr5NL5ZnoTyuuBVNaEfgENpo/QydH+Nq3orD9AwmtK
	avbhF2xz42hiZjx1ZpVXSgGtX82GdBHLEA8CkvkPb2W0aETUXv9DWoUQHgDRich32oPulJiADxcvb
	WcxNyQ66SRejnypYJ+1R5VfEih3ZDORiqTkZPcBF0BDU3T54PnAMXxPf4PTEyZzFH1utLxm4EWnxd
	am12clfFd0uM4H7LGy/o4fNeKndeE3Eo0RP+O7JUkMOrLVPUIEHPmAOEc5zxS4SKIECFPZXXOZNvl
	1SpjxqhMAw+E2A6Dy5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnoq-00000006EQx-1oHY;
	Tue, 24 Nov 2026 10:32:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnon-00000006EPP-2ElP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:32:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5c14a204305so2846214e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516327; x=1796121127; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=lQwQqMetqOT7LHvARgXM4NHa6StXoPY2Ib66kZje/jprMTqRVxKnHAPKdraRdCEhgQ
         HNSw4gH8/B3Zc/5kMiqMZPatzJvWoMPj7cZUV+PmoqIimzjTMYiKMUTT/9b2+XjYEUOb
         k8hS5dUoBKH/mCB5Wv7rAgTiYdxWBLarxw/YVfnmoVbIFW4TreuaxhJPTmVJp50fx/Hd
         IQHlwmnoC6QgXjBSOP/30dvw/Pe8387EEe5W6Vga2nBa9ipXpP0ZLQXxXoA/0Xc87YOa
         4h5wif0DbIwyXT5ftT78ovU8rq7z+LaBmMy1DBd0DbhXKhPkaiRjdPwcgixMgR3kNLdS
         PjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516327; x=1796121127;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=mLsz6OQWgVVVmucGhgljJoy4tF0OunooIWq9Q74Tf/a1Y5qP1sCSH9Vu62/BM2o3WY
         BX05uhnTCzELCb++D+FCl6vxYLPRMZ/SNgbKTbI5bHY8KG142lsRkuE71CJUL2qN2Cvl
         mRmPVjMOOfaMuMtWNJS6UATTEjBjWQD+HbwuGmh9FHIlzciCUmftzCY5m8kjTWLT4+ML
         pF7XUILoqub9fmsBaTay6TRKRezeOfBrF9mExtIxZRRC/pCfyZGtWmW1F90zJSZcjsaP
         5JA2TEWXwsg8iCpmq39fLjYSTutHmRP8oq9s0wEZX/vt+y4MgIBTmsvjJnaTsc3eSNih
         35mg==
X-Forwarded-Encrypted: i=1; AL+hErFntApBBX/FElrtCkhGknCf+eiTXbpSTB5HDM4wbfLDjCQQhAi6fVkDRnsl//LnVAJ4ITQrqgHDHkeLyLjq6boD@lists.infradead.org
X-Gm-Message-State: APuU4Z9m9w1I4u3zMopz19bjKxTvyiV/uWa/NBzGj77Ov6xUreLaeIT1
	MZnYUFy3kjNgKrW1WOtzpTyRLG8IHk443WpMp1Bh9CsOt9PqxAsJBgjN
X-Gm-Gg: AZFdTZdofROmgkD84Md+dicNeblrA4hIpGWridZl9bobZ0W7HNUd2QIoVQFZDh6fyDw
	WlPYBWMhNBte1HjuzrkbJ9NwoZt+4tGufSOT93GCaAYa6DE2nU6FvYQ8nmC4H0TOTQTWrz+Fm+r
	ACTpt/9BZ95c5UznC1jN/K0+thE7z8ZsfZDas8EU1moqB/sGE0h97PLgZ+XwWgKfM0muQ0MwmuJ
	OQ0PB0iRWY0c4TwBOkTsSdIGo3NNBiwkPHGOrgFL2O4ta9jaBZqQKAGmKnE/n7VPtlgOPtdvOL7
	g33vQ1z1MBaBTCbLx+IimQFFaUwYk4T7oil2J6UeXkLT8ixnILSPqFC51cXIMRTaK4eQtjRcfmr
	0k5RCbH/e4PtYkrSvwJ3BjSf22QoEftAnoMsWptJJs775XUfXjJNYiPzDHS7bg7M6c1zeqTbU6F
	bwcg+rtbKnp8QlQHrsSq3r21ivH9eVvFEL1WcwdBW7ZywRQRZTeiSAIwa8jcN5x3vQnOIos9Ixh
	l7PEspxSXwRR58LnlxHZDPLHNuweaMJcJazGiWvBJ7RSFDVVTIUGUdKLSmmZjePa1iueZ4W5C7N
	FkuCuZZj5E8038P4C9BIGqm3vIJ1TCFUCuHEN/8aNTdsEI9CulmmZcY=
X-Received: by 2002:a05:6512:3d0f:b0:5c0:4cb:2415 with SMTP id 2adb3069b0e04-5c1bc7c9a8bmr4202658e87.28.1795516327013;
        Tue, 24 Nov 2026 02:32:07 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332c9sm3680542e87.7.2026.11.24.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:32:06 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: cs7542: Add CS7542 PCIe host support
In-Reply-To: <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123-b4-cs7542-pcie-v2-7-f589a9cd0bef@gmail.com>
 <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:31:25 +0300
Message-ID: <179551628581.3.13614361091709904582@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_023209_582952_FED002A5 
X-CRM114-Status: UNSURE (   8.28  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philipp,

I'll drop the PCIe host's select of RESET_CONTROLLER. The host only
uses the consumer API.

I looked at reset_control_pulse(). The CS7542 host asserts its
exclusive reset before enabling the clock and powering up the PHY.
The PHY has separate reset bits and leaves the host reset asserted.
I'll keep it asserted for 10 ms after phy_power_on(), deassert it,
then wait another 10 ms before accessing the host registers.

The helper would cover the assertion and hold time for a standalone
pulse. Here the line is already asserted across PHY setup and the
controller also needs the delay after deassertion, so I'll use the
explicit sequence in the host.

Thanks,
Fil


