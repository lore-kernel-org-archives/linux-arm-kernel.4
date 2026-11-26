Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=416PzUaB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qpw1nyYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=; b=416PzUaB1j/4Y5djWy6tXX80hY
	kxD9yCF8M6IEhXnXOR8Tf54ZInourNbqy/5LDIDAFIqD0r72BjtgMuIO8UWnDfaUESMt/Xn1BtrQ9
	iHQeVa4iNDyelQEB1y2+jWDKZ8Tr1gRRGaSsiJ1Laabg6nTObQU13PDgxZqqA1mzazo7zKhqsnnHW
	p2MCs0FoQFc2oewsSSvSM5yBXMzK4IosWZJPFtgWCG/XMTgDLzWimjtERU1y5ks8klGJ2CUTnHFkR
	ikyxGl1+9lVkBpq7Z/XorR2tG3BTRAYpLCkjFqFD+heU6+MVPyRSSeqLtKFHypBZZoi9WsIWS4cfP
	hwWRJbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWs-0000000DLrX-2grC;
	Thu, 26 Nov 2026 13:28:50 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZWc-0000000DLeN-33HP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:28:37 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4711172eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699714; x=1796304514; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=qpw1nyYgt9vfUN+IKVBdpabMOSv3SF68TLpJCRBNyMY1s/T0yqnZ8csUxUFc9GMt6v
         Av2igQ1H/KZLFUf15UnKdHapgcG8Rdw40snEPB7+7RTcaABiSDjSjoVjknAkiB+P0te7
         1+4qPH8+hmPoc5XIxmKcEQgfib5/PoLVTHDc4SYm/LQv04p+Nnxws91MR7QaOjYNSpUp
         WY4oZzRuINdx5YejmYvOqENanKp+E5gIWD/JSuPbCvVTi2tnL1J15bry6Ay2jHlLS8wn
         h2UIYxZxEC5e2heP003lUP0nDEEN4VgOUY/DLPVsDCGpZxdxGmC1aZg7m0LJZq/ZTbAB
         ytmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699714; x=1796304514;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=nm1NsFs9EBx7l3HBgM6msRaO/vblnVZYG67Vgbm/vXZo/SYfEuuQ/TmJNb78UyIXsg
         0E2adUCLi1idiWnVi7e30dNoXz6WcShynYUMNtzJDyHiG+4oxoZU0BHUBcHwtLan8awC
         bwacNajWqKGB39CPlfcn/+9SZaSJRkB50TfDR2JdwYGL33Ia/mw2faphqNefaWG7aVqR
         MhjOisSGEnjR63VH0oIQdAbk7bo/kr1CJzSFT8JbAryuUBD1gBJMC2L9Y+cQOfeJrvRy
         cgulG50lG1C9cI62Doqxf3JNGo8KgrkVlKa5XLc+7/UauwD/ZEh7b7DJk2kSdAjI4PTo
         IDyw==
X-Forwarded-Encrypted: i=1; AL+hErGBhyCGqvtv4mYjMCxNlvdUAtFJOXY8RCDyliwQDRLXgl0jzP96Tivbv/TDpCkVmnZtG8mzQjackyDzS8ZNfXCr@lists.infradead.org
X-Gm-Message-State: APuU4Z/T8n0pzLDZdqtLFxjv4bgQLZ5foEruKmNQX943SF/LwPSk9vLd
	x1lsWxs7kfiPASNqPbtfR5P3b+KIknBaVyO6iIM26iSTF8Vq169KbL9b
X-Gm-Gg: AZFdTZe2sHUBpJYH1UPpKRA/Ht311dbn2MwntRAm5lZSV88JmWEgZC0Jb5Iwl8Sasez
	B/J9ToUtJNQF6miiaGwJR0yDGc8ZmidGDdWF+/xlNn8eeOyj/3uiC7yqB5Ah6w6X7T7zt2E2Mky
	yQYheSmqSgOk4u8MfKSZ6fTDeTv8RzJ0i+iu++CJgbtJLx3THqelMFYkIeOWNst+I/DAOioMB9M
	cFpDY6FgLvmy2OP+IXdc4LIMHo9FODnXfnlF5eXsAYrD47Kpll/EZGaMsq1BlewJgYOIFlp8fvT
	0ptTXPOfQd3cKAdRBerXYhQGSfApvNhQSRnBAG2S8h26Dr9g95YnXHI/g3tMLFHMR3chQds/ppf
	+uKV3R1tWFEk1EaNZU0u636HVtd6Im42hrcOpBSLymixzOpzvTY0D4F5v32DxdRj+ZZPCxtfnYr
	EimRVU1UnHFd1CF/wgJmb5p+8jkeJovnOOwDY17aX+AWxJdvmSLezx0xezP4F1yg8mxu0x0HTTK
	3LG6cLlWDEwRuVNarpoimlY0RU095wHEHfPy50KOzZCvjvJl7ZeSmLkjrkYLPCrq6C4LsZ6RKOE
	zJ6KIDGvL4TmivDRUI5s9L7SEMEJWAZ6hRv2zIf4QeMO8GB8MoqRylWx/+2oQo3SJrs=
X-Received: by 2002:a05:7300:c00e:20b0:386:c3ab:ab7d with SMTP id 5a478bee46e88-386c3abaf3bmr8681892eec.3.1795699713612;
        Thu, 26 Nov 2026 05:28:33 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm59213477eec.7.2026.11.26.05.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:28:32 -0800 (PST)
Message-ID: <86a7174f-c44b-4663-862b-3631b0d6c5bd@gmail.com>
Date: Thu, 26 Nov 2026 22:28:28 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] PM / devfreq: rockchip-dfi: cleanups and RK3576
 support
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_052834_801968_FF15926F 
X-CRM114-Status: GOOD (  21.90  )
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

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> This is a combination of the DFI driver patches from the following two
> series to ease applying to devfreq tree. It is based on devfreq-next
> and there are no other dependencies.
> 
>  * https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
>  * https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/
> 
> Changes in PATCHv4:
>  * Link to v3: https://patch.msgid.link/20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com
>  * In PATCHv3 I accidentally used the patches from PATCHv1 as base with
>    the wrong DT bindings; this is now fixed
>  * I've fixed num_clks typo in kernel doc (Sashiko)
>  * I've fixed incorrect LPDDR5 BANK_MODE_MASK for RK3576 (Sashiko)
>  * I added a fix at the start of the series correcting LPDDR5 bank
>    mode value (Sashiko)
>  * I've added a fix at the start of the series avoiding usage of
>    uninitialized memory (Sashiko)
> 
> Changes in PATCHv3:
>  * split out DFI driver patches from both series and merge them into a
>    new one; clock controller and DT patches will be sent separately.
>  * rebase to devfreq-next
>  * collecting Reviewed-by / Acked-by
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Nicolas Frattaroli (6):
>       dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
>       dt-bindings: devfreq: event: rockchip,dfi: add rk3576
>       PM / devfreq: rockchip-dfi: move to per-variant const structs
>       PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
>       PM / devfreq: rockchip-dfi: use bulk clock APIs
>       PM / devfreq: rockchip-dfi: make RK3588 use its clocks
> 
> Sebastian Reichel (5):
>       PM / devfreq: rockchip-dfi: drop incorrect shift of LP5 bank mode
>       PM / devfreq: rockchip-dfi: initialize dmc_count structs
>       PM / devfreq: rockchip-dfi: move register offsets to variant struct
>       PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
>       PM / devfreq: rockchip-dfi: add RK3576 support
> 
>  .../bindings/devfreq/event/rockchip,dfi.yaml       |  89 +++++-
>  drivers/devfreq/event/rockchip-dfi.c               | 297 +++++++++++++++------
>  2 files changed, 290 insertions(+), 96 deletions(-)
> ---
> base-commit: f9316c13d6f621af4f6f4a6089d3c989ffe899e6
> change-id: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>

Applied them. But you also need to send the clock patch[1] and get it applied.
[1] https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

Thanks,

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

