Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02FE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i//P/snv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy938g/4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UlhJcu9wlQGccgc3eyv9RsDxodKeawxsHzV+5724IEQ=; b=i//P/snvGxg0CpCQD0SOgTpZWZ
	2HNNcnWgGB1cBwHV77DbAi0so+wfNyW/iT+iO/FKXv9LiTtfJz0/QDoMVl441em/xeHpF+9VfjMYI
	P8XhsUmdYOq9VVlOCNqF/1whNJ0fq4iTJWQFjtIHmuk1D5KIzUBJFvJMApcg03UsyMPmBxmTFFGcG
	zUsmKRkIS79HxXFckLqCanPjL+sx79Qh/0dxef3Tq7sH7HyeDWKuGmplkbisaoXFtQHcGcsT2u0d3
	EmNujIReISC99e51/HhY4LZToSWQrWP364rrkx1TtClCOMZVcIXzvjNmQm31/DPaayl3Pueo9xd6I
	a8aRhYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSC8-00000009Y5P-3oLg;
	Thu, 12 Nov 2026 10:38:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSC8-00000009Y5I-0jbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:38:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6F5D40F04;
	Thu, 12 Nov 2026 10:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E69E1F00A05;
	Thu, 12 Nov 2026 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479894;
	bh=UlhJcu9wlQGccgc3eyv9RsDxodKeawxsHzV+5724IEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hy938g/4igzFgZNjlYHansFdKN84iLAOP6GO3DGPfd3lO8kATH511IHcPmG/OXvQf
	 CtmX8jk5hD80fGKSMNuTEJ8JXT1VaM1PQN6Lo9CHe7sMDSw45YvyJInoIXiB+qKr91
	 IACb78C7dwP8dOGcSe53M5bIHrTsTU/jY5ibuTPLwx4p44ouTu23FLlklRUaETZUW2
	 lqEO54b1bd6DFLcJHMAfytA9Tlk+0Y1tk6+0F2LBYaKZdPPe8uzp1lhHE6xgB8TKnP
	 bl+wzgMJfOrHwp7se6dkdJuDIryZupIOZhUAwFblH2D/dlQzvEy3gmZsZV1q4/bNYQ
	 GVHKgUZRxNu+w==
Date: Thu, 12 Nov 2026 11:38:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261112-sociable-prudent-newt-be2b30@quoll>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-2-shengjiu.wang@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111031808.570680-2-shengjiu.wang@oss.nxp.com>
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

On Wed, Nov 11, 2026 at 11:18:04AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HiFi4 DSP provides a separate reset control for its debug logic.
> Keep this reset deasserted so that an external debug agent can access
> the DSP and perform debug operations.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


