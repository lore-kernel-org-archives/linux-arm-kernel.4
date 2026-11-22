Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+UH96oP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asxzsACs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iQ9G5wuAOwv32sHYLOPOq6WxkjdWNjuGf0RjBsvIM0Y=; b=Q+UH96oPGXAzsenQACbc6IgJNz
	JyKIcKuVE7UajoMyxGzpQ0PEsBqeCSntIZeOUQxl/eEliLGKsrK8Y817VIPKePPifYdKq5hZtzp9q
	GIKO/2mVzMtpJ29R4qpezHWo7GTe+A0aic0XeO8yRcHYvqeB+J++Hj0s0ts8hSl+zCRz31epIz/g7
	YYr6j59Y+WD3cVxCQkPXhoxv0oGMRSVfjv2Y/k0h4Fg63nJLdoceuUdujn0jYIB/69/o1vXlENtpT
	5bow5FEGmCzsIm/AwCMW/BjbyYoB0g41FBMzuMB1CLCUlGx/ALUmmSmZHMNflUyeh5ADc260hdVn1
	7bOK3OSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB4K-00000001PTq-3Auk;
	Sun, 22 Nov 2026 17:09:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB4J-00000001PTj-2IB9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1001242DA4;
	Sun, 22 Nov 2026 17:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278781F000C0;
	Sun, 22 Nov 2026 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367374;
	bh=iQ9G5wuAOwv32sHYLOPOq6WxkjdWNjuGf0RjBsvIM0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asxzsACsMWmw+sV/Pyg/QnwsmIcjhuFrqYyfNks6EzrrwDqgDJxL66+VDMPEpZw4J
	 aLH6aZRUNCMu6+PsLBS2pCsv2dKi8JONYQnG3Sw6KTBpuapkWhMB26i39TMWs71xii
	 LPZJjEpNPfWzZHv3MPPgaX9jSchzd3MXD7lu1dkg8gaDAzVMaw34U9xgmXY5Yq5qpV
	 gaaBeIC5sqrgo+oY8nCcnKdF/5EuxZ9UVtljP3xMGfjB1dUWCSiMO+Xwvj2JGxa8W6
	 Vj8+bIrUCWd2ajfovk87r7utJ3g6dvyIUeHa7nczhTrBOlLfxkEipz6O9qVVSrh2nD
	 QuO5lGQCCxiMA==
Date: Sun, 22 Nov 2026 18:09:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, michal.simek@amd.com, tanmay.shah@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add RPMsg resources to
 AMD BRAM rproc
Message-ID: <20261122-dashing-dynamic-agama-d617ec@quoll>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
 <20261119220405.2838553-4-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119220405.2838553-4-ben.levinsky@amd.com>
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

On Thu, Nov 19, 2026 at 02:04:04PM -0800, Ben Levinsky wrote:
> Add optional mailbox channels and reserved memory regions to support
> RPMsg communication with the remote processor.  The memory regions hold
> the vrings and the RPMsg buffer pool.
> 
> Assisted-by: Claude:claude-opus-5.5

Drop

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


