Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JHsIvHdy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXszFjlt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=; b=JHsIvHdyoTyDepQrOqrzf1juEK
	+zzFPyRLZL4mppMM5EjSqo/NRM1XNCUffTOXr4zyJpkisCaLUEJtHDD0YPFxlp3Z1GzUZ53yC0+5k
	HEtY290aaiHa9+Wns0UPF0fdF3iQTslTDJlcE7Tr42EyguIDohmdHzw5sYDc30oyWrXwa02YfuM/t
	NCbKoKXutC9uf4racyXsqZOUUd56OfXuK8bV466t2KiizM/yvBbdFI1pQpkI6PTnY49UirjbPTxxc
	xQl7XY7l9rF1pZFBFiIAPyAMgKAakGg65q51yQkF8PnQNOZu7/5PB2cm0SY/FJC07p69f+iIE7Bzp
	IZ8BGunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ2-000000021qH-1I1F;
	Mon, 23 Nov 2026 00:53:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIJ1-000000021q7-36Km
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:53:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A34441687;
	Mon, 23 Nov 2026 00:53:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795395194;
	b=MYTn9vex2slDM8p8bvKAoAuviWOucCKu/fKw+O93Rege6vD08XJYEmZmCJRFNet6NQjl
	 9GpLvoSob4Z/cErz2jW/42pYVwziwklh+oVfPgvf4IyRhURWgKJ+yL4hAd43MQVAeZGsP
	 qbihfdl0x/XBzIew0QvF4ZIIjmV5UJiyNFO1u3+j59TgyiAvwo62P7KMM5DhOh1tCTbAo
	 9Cm72ZReKVStt5gMU9rOBYuwWEiAN0ugDhehGQu75wkHYBqCRsgwbXLbaTbIerz+LIIqQ
	 Jzpax8gi+Tw8AtTex2nrW6kLj+qOErVhFueAGxqJa3ot9NatkkQVrWf4sJKUBvD+ujg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795395194;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=;
	b=IXGqoCVR52Zw9m0W1zjFyrhOSkfNnosBe4IIIqJNSuBzL33fddgbnOYxOntkHHq8XUyV
	 9s9RyE/bIWVD6vgm6Om22/wMN/0NJAIpueMhfUbXahIJVcmQcNrIo7Em8T/jHQDFgkBKE
	 clzgkwSrtNMQGF1V11fSa/DDNqcIa/gB/O23JlHvdIrRnny7IpdoXu0Lu6YA1mlIkGPWI
	 TIMwyPMdqTkq0aQyhFTJeAUD+/phr1ViIAcw+jwNRmvb1ELHSnwUTBe8LmvetilgXk5Es
	 NenB/rdXvSZr7Rdc9FG63hJt/OgbOwYjOQVCUFfaqyQTXStezcKYGvd4l0OEZJmKYUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63DCA1F000C4;
	Mon, 23 Nov 2026 00:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395194;
	bh=NIaNw3yNCHIlLX81dyeVjq4kOShFD20/PLGsWcpcsTg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UXszFjltA6oudYfecCPMT54iQJ8mwR5xocYFe7FCiOJdYnY0bQ8cZ+LohgTFQbjeH
	 qvLGgfb+f+PXvL2pLdbTODe5QFaYxO673DpSVcA72+ITkQPjI6i9AUFoJ1KAY5j7d2
	 Bg/cEyGc1Td6tOcAdQabVn+DJv72daXIFOj0pBn4a3rS5TI0sp3c4Wh3uyYZ5jGInq
	 R92Bsg/2i48SPrryildxNXQUZO4SU1W2fY55kcHICxyEtVG82CudphFE3X//SS1e44
	 6OC+plx97TO06Zqp55LdM6Os127fZhrv4oo6vQFJ+ZM9t9wys5IPJNPvzS2DweAK3s
	 kTv0VQXVRSFrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B9BF24430F;
	Mon, 23 Nov 2026 00:53:06 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH 0/2] dmaengine: Kill channel tasklets in remove again
Date: Mon, 23 Nov 2026 00:53:05 +0000
Message-Id: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGOA2sC/yXMywqAIBCF4VeJWSekUWCvEi28jDVBFloRhO+e1
 fLjcP4bIgbCCF1xQ8CTIq0+g5cFmEn5ERnZbBCVaDkXNbOLYu9i/M60cqbhUit0EvJjC+jo+mr
 98DseekazvwlI6QErOPqCbwAAAA==
X-Change-ID: 20261123-dma-chancnt-bafc519baef9
To: vkoul@kernel.org, ludovic.desroches@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com, 
 dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795395185; l=1164;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=qcysPc3/OLnwjWU/7y9whp4PW1EWxA7jm3IyIBShlQM=;
 b=viPMiyR1BGW2hFR4QUp6sDZ/oVlnod+EWT94IaiABkhtxXpqteeApyZoVak3J+Ov8XDOf1kbz
 G2cnvwMDLk7CRdM9H+PhM9ew+nOFCsTEO/4FGFuCy1NFNEgCPUTXfgz
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

at_xdmac and idma64 kill their channel tasklets in remove() with a loop
over dma.chancnt after dma_async_device_unregister(). Since commit
e81274cd6b52, dma_async_device_unregister() unregisters each channel
and decrements dma.chancnt for it, so chancnt is 0 when the loops run,
they do nothing, and a tasklet scheduled by an interrupt can run after
the devm-allocated driver data is gone. Both patches read the count
before unregistering.

These loops are also touched by Allen's "dmaengine: migrate channel
tasklets to WQ_BH" series (v4, 01/33 and 04/33), which keeps the
chancnt bound. The two fixes don't depend on that series; they make the
current tasklet cleanup work again. Whichever goes in second needs a
trivial rebase.

Found with a static analysis tool and checked by hand. Compile tested
on x86_64 with COMPILE_TEST (W=1); I don't have the hardware.

---
Suyuan Wang (2):
      dmaengine: at_xdmac: Kill the channel tasklets in remove again
      dmaengine: idma64: Kill the channel tasklets in remove again

 drivers/dma/at_xdmac.c | 4 +++-
 drivers/dma/idma64.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)



