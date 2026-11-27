Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SpYqsqFn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtt1283S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iM54K9orOriSVeFYm8Tg3Py4IYE5anR7lg79PbJmHes=; b=SpYqsqFndoPJow
	m0N6IN9cyyGoARTKZDrzdFrNVRurFUcEVPiS9tsNnv0txhjE1JLyPR/MsnCzW96QvRHyY4Vxw0vRG
	C5bDaSKojQTz8Azx/L/LjSk42jqtlOm5spH5LzLSdqBUBJLVKk1Hvz7MuuwZSthEgZYayXPtvo3DR
	3eODWNYSI6e5Qkg2Cu3Y4kln3ZEmdA+AOXR9B1jDUdOXIzc9C0Tm6nUmF/nXwiaVQuYWOpnuVWDTB
	TXqn282SHBz+AQGpuXycu1pE19yM//9dgCxiNjtuh66GF9iahgPA7MxHUW+TkkxXECiqd7b2iDmMg
	p5UYPp4Iqc4rZzL0OX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWurn-0000000G2Lx-2NVf;
	Fri, 27 Nov 2026 12:15:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWur2-0000000G28L-0Q6x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:15:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 893F76254E;
	Fri, 27 Nov 2026 12:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B0A1F00919;
	Fri, 27 Nov 2026 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781703;
	bh=iM54K9orOriSVeFYm8Tg3Py4IYE5anR7lg79PbJmHes=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dtt1283SmVlMJDALB8+fBXMf9DpoJ/7duRnkVxmjg9BRCMUmL36GBysLxMuEUnc6L
	 NW05HR0AteyNXiALdjX0kNEoQS1iGQV3dNU2074CQ6xn5Qy/KAuuQKK7ZgL/v0zglo
	 aQnlcYatWQ/16jLUmzBmCzBq16QBDXkb07IHKc9bPo48Pmn5HEWsuSw3yDu8lDQh15
	 4vVAQNpU+4801ZTfCfRhqVwKEc6VoUKRlrZfCLY1/mdxwi5sjFq5uqSTfpq/rI+j2h
	 t1BrO1KSr6StxWy2CHoeWL3nUFdig+6cQvltOqpUS/feBqaZmViFLklXQ+sMzB/znc
	 Ti308wFpeHxyQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 8/8] optee: Add support for lendable-dma-pool
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
 akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
 ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
 ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
 danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111110738.872947-9-vdonnefort@google.com>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-9-vdonnefort@google.com>
Date: Fri, 27 Nov 2026 17:44:23 +0530
Message-Id: <179578166371.172025.1170602724631713692.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=469; i=sumit.garg@kernel.org;
 h=from:subject:message-id; bh=Y+fnpb+6sgyx/TICAWkXBLbJdNddcf3dmWbm5GHNfSA=;
 b=owGbwMvMwCV2RWpxpe9rmzmMp9WSGLI5S3Stv366/n7plf8Ot9/EukWzz7haXJDOvVWsU4v9/
 t/qn+eWdZSyMIhxMciKKbKkfv02bZvQv9pQqxM8MHNYmUCGMHBxCsBENjcy/JWrfuZ8cN60h88P
 3OLZJalc9e5m+ebZ/w/xd75snDkhw3oaw1/RFY9W6+5S/7WJ+YNH/jKlWJfFzIsSbMtevzAJ+Ln
 f1o8ZAA==
X-Developer-Key: i=sumit.garg@kernel.org; a=openpgp;
 fpr=65F5F696B612FE7D553AC80CD41AA3794DEB3C9C
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> When memory is lent to secure world, fatal CPU speculative reads can
> still occur while it retains a cacheable mapping. Use the
> lendable-dma-pool API to unmap pages before lending and restore them
> upon reclaim.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Thanks for all the rework, the OP-TEE changes looks good to me. FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

-- 
Sumit Garg <sumit.garg@kernel.org>

