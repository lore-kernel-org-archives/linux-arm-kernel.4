Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gJi/oQZX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X/LViXCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aM4hcpEAYE4AQGcwCoRlsvLuMHTZKS0gMuARZziOX8Q=; b=gJi/oQZXukM1Uvz4Uj1IefxkIK
	o7ep3W9236vtByUo6P6FU2aWqBlQ2Go+QUHYQgMeErrFTfRF5Gv5cx9rwUvdBAxs7Ju76JadLjUdH
	XHW8f+UPKls7imHjhHQ0EMQjTHDlVmfYaG+mJvIkssyEmBF7tizuNLRvUZOC+N9ERBhbq+WJukEEF
	CILaXyK9oo5sFUjnFGGD+4j8EeB4uO0zK/sCXsiMsx09cHUxUPXwiCG+nkAJ8aPltuWOWvuGlLp4i
	JtviLBfdpZVawQBo+IyVKhxFZa922YduUYrBtJb+gMqF9XCpdpvYiCpQbiw50Vsej2FU43frmrDXn
	oxBhFO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPJn-00000000n3f-14E7;
	Mon, 09 Nov 2026 13:21:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPJl-00000000n3V-2hIC;
	Mon, 09 Nov 2026 13:21:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05A4B43EA3;
	Mon,  9 Nov 2026 13:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CAB1F008A2;
	Mon,  9 Nov 2026 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230508;
	bh=aM4hcpEAYE4AQGcwCoRlsvLuMHTZKS0gMuARZziOX8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/LViXCNZCk8meobQtpDyO3W4Ic4iip/1bG0zCnqIQf1YOFjZ+j3GGjKhuogqUNfu
	 Quivt+w0tbb5xjmb1vQVxLOAJ1IWmgEYxMe3RLISMFJ7yOlkxXdMmg4OpAl4Xd3jou
	 fAEiJCLNJiaHaXza9drh05qHIf8SVBubOequDGJSLFzegSZ3Emd1Oj4SGo4BTv5OKI
	 g8b+xJvl7Zha7eCJ5lNeeHOk0TKFYnrZsY8+j7klbZ9wjwCR608+OTZewMpTQIxXA4
	 Yw+s/Lqe0/3gIBaMmWump6Bm+GwZGXkTzZZeKSSDG4g0RNpNw7avHonDhhGXhXJ1H8
	 Xh7Jt3c/oIgVg==
Date: Mon, 9 Nov 2026 14:21:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zakariya Hadrami <zkh@mailbox.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Gary Bisson <bisson.gary@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
Message-ID: <20261109-impartial-ludicrous-asp-fd8bfe@quoll>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
 <20261105210622.523747-2-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105210622.523747-2-asalde.le1@gmail.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:05:59AM +0300, Alexander Letuchiy wrote:
> Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
> with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
> X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


