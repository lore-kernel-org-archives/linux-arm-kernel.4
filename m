Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zc8E/R7b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPhPRW9x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=; b=Zc8E/R7biMFDDLIJFAJt1/RtNf
	tO3vCF7QbqJ+oTYIFZAgCLwb1ZVdUSbx73RZ/OTHhtC2jyy6ZR3zojm4/8Y7HxoTTUvInkyfTpjKM
	pq4qBnLYklUihaXXj7IH3VG0z1jYKYqcxd324OEWGKxUd8MmyX714mbPgrZAZwLn2gaq3Nv8ytr4Y
	iRwp7/4jhbyslym/4HnrOP9Yr7zimxxshBAI7lcwX2QNdBu4OFNR4Aul7vY4jPjKedkgPqvMfYOiu
	w4CMzmrNcu4ANZlDCxYU0Mu+TEoWAQEJCoNwPa1MNgeBdFk3RVAAwTHE2pzsteVCx/VSyhCXylmNI
	BzudxOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa9l-0000000HYDt-40sM;
	Sun, 15 Nov 2026 13:20:29 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa9i-0000000HYD7-3CHz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 13:20:28 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1b3acec6677so3358807c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 05:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748826; x=1795353626; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=;
        b=VPhPRW9xI8XF9aS+C0ZfMrtks+l9XtIXNSvzdeWbv1wjBKScFsPqBfqGT9Juw2ubK1
         /9zoOhFLQABA8bc3bOpaNW9yn8OuOXMEH7MfiiYU4erWKouq5vT4B6jPEmKxVBWpFWql
         n2DedRBgkf22zTFmDQ5dz7VzdLg6W+mTlyDat/1Rf+bcRenb1tQxTZhRTIuYDJADveXJ
         gSCYGNAsNl3HwRQqpfsjCc3hKOaOHoce5mmaSNWGM8hHxxNnBDc8dD4i9XIKPT2Ow+rR
         3MWCVGxVI8dQfwZLCJeGqcrsQSV4N+KbscuDjXT23Vxc2IPD4Xt+fouvv8q18wThJ56b
         aFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748826; x=1795353626;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rYsyjftvDCPeS9SbbyhKVYUDY9LVQRgCngM6FVnSFQ=;
        b=HVCWorFUlmXmsnlMtclCkboJ8RxlG84iayilF7S/u1Pdu7FkYLpv4MoOKOsd8zxyEk
         p3G929/tMX6MXrI4HTT/tV6kJJOW0k3XVTYgpn+MEVcIVvBLXVfz/av0mZ6Hpeg5imS7
         ybL54Mm5xk5vSEQGvAmX0lVj8jLU6l9EGxSSMleQkJ6UsC38NFcCOZlqA20pEmZyztE0
         SmEtMEno/Hgpg2hU0xxUtLgN54rRN128b6vf4dyOrnYI1RPDuPgpKQul00pQFb/D0srl
         ykdJt0h3qNvUvvkMWk3f4CLFOGpObhl3XNbmtclQh48s27QG2rl434EHM+KQdBzLUR8f
         At3Q==
X-Forwarded-Encrypted: i=1; AL+hErHD1JX+0pRMLjx6J1FB6hpC46xiozsiD7Qd1okIP7HYP0k14nF7uGrWq2pHj2jtVTwZE4D2BgUBDv3l0xW8ByMu@lists.infradead.org
X-Gm-Message-State: APuU4Z8EcgqKoh+tMpa2ktqQtNR3U60KmVWclPUBjRlg8+2NrA1bJRRG
	qPrvqSiiJ8X1i4YEJnNQuIvUXDjpQUaDhKlm/khLKSnUz+zSbKXwP+t8
X-Gm-Gg: AYBFou1MPT78wEOE3qi40R/sGO5wuQj75XHoBXnmvFoNtujzV+Vv4aJysLTjqiPpj6q
	QIMM0sdKFh5rrK8dj2s1/uGRo/0Vx1PBlcYwflMXoeqK80ODySw9CJupoYKUcD/3uruS1zKwTQs
	nVPJx/4fLuWqFbzyyBc7k5nks9DHeJDmwBUP0tKiWFBuj1WY5MSLSrqfrROnOMmzT7+Lyv/SriL
	5D5fhDZ0cCK0QCVgioQwTaoSnZPeEMY16EUEsubi4hlyBxHvN81bb+seioTj9XoDarMbWK/pBJB
	kAhcSe8fZKD0cVX4/BFw5KUkPcED2jcgGY48i7yrpYTMTrwO88xCPP7pFAeMPVefqF5DfQOXlxM
	KNZLBKrhGVnyxlOQhGEXdz8wwRqGbr0S7qXbnhoxmBH2wUZ7oZkLZhlXDbEhWLehUAFEXUV2du2
	dFrJAeCHD1t+NRacKXxBF/8kdVTm5CVouoy9rpdFGE7yg+LpXXwr7QTsX0R7U3exYWZP+SPM2gO
	BB1Ig6vUZPztiBhqUdI7mDLINiPFbA064DCOhKJ5c9Yua0+YjveIjFySJRqITb9kFENBni6F0QP
	l6Ns595Xk5373wC24X3Sm2sjsCLVQou4dDt7VnJLiQQQ8oeVk87fb/HU52dk9hyaqknF
X-Received: by 2002:a05:701a:c9c1:20b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1b51828ef74mr4571335c88.3.1794748825692;
        Sun, 15 Nov 2026 05:20:25 -0800 (PST)
Received: from [192.168.35.213] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm28084123eec.24.2026.11.15.05.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:20:25 -0800 (PST)
Message-ID: <9f85f4a5-ee4a-4c0e-b902-abea050bb204@gmail.com>
Date: Sun, 15 Nov 2026 22:20:20 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] PM / devfreq: rockchip-dfi: cleanups
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_052026_827265_D21E86BE 
X-CRM114-Status: GOOD (  21.35  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> This adds proper handling of the RK3588 clocks required for DDR memory
> monitoring, which involves adding them to the clock driver and the DT
> bindings first. The change is done in a backwards compatible way by
> marking them as CLK_IGNORE_UNUSED and using optional clock get in the
> DFI driver. The series also applies a few cleanups to the DFI driver
> while at it. This is done in preparation for RK3576 support, which
> will also come with some DFI specific clocks.
> 
> As everything is done backwards compatible, patches do not need to
> be merged together. So Heiko can take the Rockchip specific patches
> and Chanwoo Choi can take the DFI driver patches.
> 
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com
> - DT binding: Do not specify maxItems in the generic part as it has a list
>   of items
> - DT binding: Only set minItems/maxItems for specific SoCs
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Nicolas Frattaroli (8):
>       dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
>       dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
>       PM / devfreq: rockchip-dfi: move to per-variant const structs
>       PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
>       PM / devfreq: rockchip-dfi: use bulk clock APIs
>       clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
>       PM / devfreq: rockchip-dfi: make RK3588 use its clocks
>       arm64: dts: rockchip: add dfi clocks on RK3588
> 
>  .../bindings/devfreq/event/rockchip,dfi.yaml       |  70 +++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   4 +
>  drivers/clk/rockchip/clk-rk3588.c                  |   8 ++
>  drivers/devfreq/event/rockchip-dfi.c               | 160 ++++++++++++++-------
>  include/dt-bindings/clock/rockchip,rk3588-cru.h    |   4 +
>  5 files changed, 184 insertions(+), 62 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260917-rockchip-dfi-cleanup-feae6eefae9c
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>


When I tried to apply them, there is conflict on devfreq-next branch.
I'd like you to resend this series on based on devfreq-next and [PATCH v2 0/7] PM / devfreq: rockchip-dfi: RK3576 support.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

