Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QrMxSovi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sprnfDJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=; b=QrMxSoviqGs2Kp
	JFZEUjjkkFzlvQFjFZVPMQf2r8t8eYwSIlpOtkxcwg35j7ippaE3QosTeIeEhgXuEEfPElk4wtA4E
	3BLHnN6/EPd9668DiW7Xjba2b7ydkNYXDYSWMBTeNwISTsbAtODBFVfdN1gfJICi9Dvjy0vaO7GqP
	6O9fk0WlmyZgDMlusPL/IYaLYklDCh6y1BTeqMvHTr5KyLQ1zN3KL7X3P3CgWK57dxdFrNDGlBWbt
	VFpEhafECtchE1vPDXB4S6b7bpYCnPmbYLF+EaxAHRmnTAqfkm9CkOfpC5HTyRTFzPevVMUFQZjlo
	/v2jxDKOsodnjOBcEgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM28-0000000Ecl3-3lFU;
	Fri, 20 Nov 2026 10:39:56 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM26-0000000Ecjw-3Lo8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:39:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so442341a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171194; x=1795775994; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=sprnfDJt3S2jX4bAl6HwBTc8aoPyJKZMLTx2wN8yN2IN+jTwWfhZrStH7xr4SOqY7t
         0SCzhX8x1XTYvmKjnbZancgpxvUyHIpuptixzJ6MDjTalQFS8kdR4MVkPZO5J4yh8TVO
         N3ye9YKyvWsNo0PyVVO1WKnbMAO9TVSGNHMgnB7FdZ55lpnl+Hfb8MaXWh/mjkUifYnF
         A2CJBYxK2d4J31LCjCQcqY8IFqTC/Ckkqh+e/TNQIXXf9PMVYTXFJeOgxK27VFvTEv0C
         Ht4bU0BNhojhxE3rIQoLaZzYucXLbrU/hbgGz/yeH+Zq3fh9G4RlPp4zZjMpDZ60VZ4V
         wnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171194; x=1795775994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=Z5pZ6pMr6abtGI5Xpg42deNO9VKPKcOkUyJO/2DBH/FxELvnGOEoFQidL6eX4zftfs
         VyyZVTSfUm+SFOw+owiPJngp83VRHPIbO2yhKPomH8W0o6MljsnAzWAE5L+HW0xdAipC
         NiaVs3GdMMfWFVQpds77PD9Yiknz1pqzavnp//+2YDAMkYq9qa5gU3o1cmhGCKRsmERo
         qK+nbhryC5sMB4Fi0RWoW2gKzbYIqIWYsnAEULKF0iRpHt/Nlcok3N2r6HKAI/uwK1dU
         5b1cZo/MTgksNaXormY11qN/4+ypctb4X3Guc8Iygig/Wpyi+FmiBFgve3M6sq62E0C/
         gEYA==
X-Forwarded-Encrypted: i=1; AL+hErGn4kML0uxcipIVph+qKOmzEu5K/H6Udf/vU/wuhWjtr99bnZbrFe41Psx2fXRkvvUvJzXV2pB/lJucVR8FHQP+@lists.infradead.org
X-Gm-Message-State: APuU4Z94HcoFwY/1Mtwr78xF+EdR0/TwHv1rPWzg58RvWYt8/haWni1Q
	CKrElf+SNU3rg4GQO87Dq8xCW/4Xip3ZSYID4So0IxNpn3dNw4y/qOq1
X-Gm-Gg: AZFdTZfmEySAxGKzSQl56gZHGFSQgztvliHimvvbbT3qesLor17qG+G/j8XxLYNq0J7
	8XxPXAJKsJE1jofBh82wJrMYqofIj8OawBScn/v4bsDMQAEuSaP8bdBjEB3Na5WqKCbYzNNXIi9
	Y/Ts6otcMfl3ZWep7KrnLAwSDC0eDpqNKVHc+NJ1GAR/s9Pd8C2xVfzqeTvFkQlfaNcTvBb2gue
	eKHCVMhc4nKoC94qsZONjFPQIH2mS3AP7sKhgyWr7+n4czHEOJZX6LWkcYARCwye176YOWfR0tx
	HBUeEYMJj42Z8v+0vc0nJClYP/tGcmgWwMOOekaMX6b25qfiJR44z/8C2pkvglW7pEHytTI3qPB
	yF3lsNr73vIiSGQb1DxSNvvIgi9BZ2W/JJw4YWTsZRMzOhYxpjw5fv8gI4i9uAG82q7pEzs0nQe
	E9k92czkNK+Zp2DByDeX7cnv4cyF6T/LlYi9cU1XeMNJDxiuyN0sTMNSBU26hXZpMDfJKdIR0Z0
	9XGGV24C8+cqMt0Lb90eSDElkx2beSbwmKZkYwKKx/LKnw4nqML4DTi9S4OVPrQ5zVbJSXb4pml
	ERCnlWCs8svTbjrltTEgQD62yAJWBlJ0Bnkdzpr44OxRdkZUMCCrKEagQt0Iui2gvOAnow==
X-Received: by 2002:a17:90b:5109:b0:3b4:e3e:650 with SMTP id 98e67ed59e1d1-3b41c9c40a1mr2219270a91.67.1795171193537;
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm3843513a91.14.2026.11.20.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Message-ID: <47b32f82-cd7e-4bd4-8072-ba859f78c844@gmail.com>
Date: Fri, 20 Nov 2026 18:39:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_023954_844762_B32F7F7D 
X-CRM114-Status: UNSURE (   8.14  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 11x11
> EVK board.
> 
> Fixes: fcfa86b3e02c ("arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


