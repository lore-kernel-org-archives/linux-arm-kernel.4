Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dB8MEC5K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBbnGlC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nWampxQB424gwxrOvpdloUObC51lUQL513OOmTFYZeY=; b=dB8MEC5KA5SdaZwD+iwA1cP/Hj
	gr8HCA2cy6GOO1HfhlVu44FKavk9K69f/XuRnBcqB+xQa/liqpXcOHVAXpl77tOX0/ewT+3v+ku2W
	YOoyK5JN0ZwG7ijOiek9v231ujsoCvSuRsw3ipIZ+fMnSdUtz1KKwS78bCEzZtI/MTKh9uJKxEAg5
	QZ3oxAgh47vXGnzCC1G4NRUCAC333hey8Hqya0go8SGgP/JVfnNuFgsIggJZ50CqSfn3rZAwFOSUf
	powK/s8ixjTblrE7ryrW6fYbFctmBmtP7FC8uRNEEb9fUQ8fPnM15vyi1/zj1ysAlkOAoC+342Meo
	Bx0As/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs9f-00000006qpb-38yB;
	Tue, 24 Nov 2026 15:09:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs9d-00000006qpB-2xSp;
	Tue, 24 Nov 2026 15:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 289A840704;
	Tue, 24 Nov 2026 15:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4355B1F000C6;
	Tue, 24 Nov 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532997;
	bh=nWampxQB424gwxrOvpdloUObC51lUQL513OOmTFYZeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBbnGlC+Exd4PREioknqiLUW1fefdNP7xPke/cgv4L+MbVdPftaz2zGHM3RTU1fhr
	 vIvfu/eri8KDimwy8iCLnJX1kwMJsuoIZTb5rz8i2eKN0V95yoCSqiytq6n9GpoFIc
	 iOcVMveapW9qgppmbcc5QSE6Ll5v3HVp0dENYo1denSkFLPyN58HsOPTvs/lN7aNht
	 fNG+n2T8bOcDntZXxYj1GviAREcUoSRz5xaixlKzPcwkieDjlXdd1B1vXbb25Qzv5X
	 urknobvdpFVWtSXN9UdF1Y14a9w64+3thv/KrfkLfrOJBjxSZ0G5tHigRhcfuqn8Hz
	 vVBUZjpLcbUJg==
Date: Tue, 24 Nov 2026 16:09:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261124-benign-bullfrog-of-chaos-9d2af6@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117022858.2210212-2-hongliang.yang@cixtech.com>
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

On Tue, Nov 17, 2026 at 10:28:57AM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, the SuperSpeedPlus
> PHY of the two USB3 Type-A ports of the SoC.
> 
> The two lanes are not separate devices: they live in one register
> block, share the same clocks and resets, and are brought up by the
> same initialization sequence. The node is therefore a single PHY
> provider with #phy-cells = <0>, referenced by both controllers, and the
> driver reference counts phy_init() and phy_exit() so that the block is
> set up once for all of them.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


