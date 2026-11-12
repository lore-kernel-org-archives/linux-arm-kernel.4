Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HbLLmbTZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5tJvW/P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zxGrY/yv5DlURBF46MBwUxTu/De/cHT0VqcnOPhuVio=; b=HbLLmbTZD8HZYwi7MmrZIitfO0
	w7MkJQ1gJWIQRLcWeYZ+6P983BnhJGr3rLaoWBAQCQfn3M9ElsugYaHCwGHrqRDX7q27wHMKuOBtq
	5sdMMWMAq/McQ5Ir7TsSmEEKwpsSTzi1HsKefTUAio0unBeaYfO5Kp7fi0X2n3SVWuFmYtjfnltni
	ZV8ZjftK1ldBNB4KpsaNrKC2aLM0pFe13seqd1YiDVdDQXYn5cd6Tb6uniFgri5DpVZoLcJj6QtVT
	OsF7FpW96yfI2WozaH+/iU+V2F5l5ckmaX9Hmmjjr/bTWGzASC4nFylLcEyBnFDI+b5rIVlwA0wpR
	LyezJGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSCV-00000009Y9i-0A1Q;
	Thu, 12 Nov 2026 10:38:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSCQ-00000009Y8I-0qDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:38:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2177141B57;
	Thu, 12 Nov 2026 10:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E4B1F00A05;
	Thu, 12 Nov 2026 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479913;
	bh=zxGrY/yv5DlURBF46MBwUxTu/De/cHT0VqcnOPhuVio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k5tJvW/POtD4AHMN//o2doJBE7F3UIluVskFSREJoHmK3WiX13ORVq/8tK8lDSy7M
	 cntSS2AuQ1/67rPzodjz6/j2aksvDFmn23pMtiLIrwbjkZpz2zIWVnnhETSV7NcSZy
	 dFZzd901HqSKpk8GLBs/Wtwu+YhM1X5p8mruRRXw5+FMaIxG+wd4dOdNmqyh8SP3V2
	 hln44v32lvdK7xGOyk6WHNXhAd1S/A0+e1f+h8zdNsXJkcsvBeUAcjIixGRUOLGfNl
	 TAu1rWTLOAug3ZbUvefTUQqEY2ScEALJH1FThfnFJHRV2tTAMTx0N/kI7W5FuJM5JM
	 RNt2v6LLQ8/og==
Date: Thu, 12 Nov 2026 11:38:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/5] dt-bindings: dsp: fsl,dsp: require resets for
 i.MX8ULP
Message-ID: <20261112-mystic-loyal-millipede-66bce1@quoll>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-3-shengjiu.wang@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111031808.570680-3-shengjiu.wang@oss.nxp.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:18:05AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Commit e1b312356d7a ("dt-bindings: dsp: fsl,dsp: Add resets property")
> introduced the reset controller interface for DSP reset handling instead
> of accessing the reset control bits through syscon.
> 
> The i.MX8ULP DSP also requires reset controls for reset handling, but
> they were previously missing from the binding requirements. Require the
> reset properties for i.MX8ULP.
> 
> This changes the binding ABI, but the i.MX8ULP DSP has not been enabled
> upstream before.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


