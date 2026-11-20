Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE69160A3804
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t+hIRFOj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCSRxWVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+8y9yhTEZOPrM/t2ZLSTOX/rAP7Jv84iSq5JYylWrko=; b=t+hIRFOjS0BSb0
	fhOT5W5yceJMiOXybGxZFNQNDo74+JXfjt+FjTARViT9VMMig6NS5vEViU6JcYDRRxPyzMZM+7vJ1
	GKjvqbcUUwzlmMBhnmc/zf7tZCxxLW0fL8LjFJzxtH5++pTA27auMW8DHZKLEbkZyMRJ2w4O8A0rd
	slI+gRdMchm3wG4tfEk9vEq6ZqmoV4aCWUX8I/sV5aZ05kG0+aXCUcAGEGufhxjo+YJ1B0D7LXznT
	Y3ss1husPNm30XZvlNHx/D178T2iLLCaVQsB4DdJQTBNMDU3nRMoNi4OByHurCbsoDqMgWOXp7BTj
	7PLNWOR9HRejn4Odt0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQO-0000000EY6F-1Prz;
	Fri, 20 Nov 2026 10:00:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQM-0000000EY5s-1dPp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:00:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A5261EFD;
	Fri, 20 Nov 2026 10:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DA41F000D3;
	Fri, 20 Nov 2026 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168853;
	bh=+8y9yhTEZOPrM/t2ZLSTOX/rAP7Jv84iSq5JYylWrko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VCSRxWVMkjj/WYk6A6p7DTCVEGKwmvJyI4mxDT7Aj7qHEPdBnJF2PImFTfM52DoJ2
	 8GYZrlJbjLnbZszgao/IBwTdFwuCEk/O+cV81Adpqu7ZJfVRDv0tPUZEDsvobddnmw
	 ChAYosCMytQsMbKQyknaPlPWYJq4LyZTyvRr08Q5snr6xOGa2kWX/+CxdcfTAAyspQ
	 I8qgkETJBNRaPK4abrpqG6nwl9hqRRr6K4MSexVlyuTnK2sj2PhBganrcsAsnk2Bh+
	 ArpHLT4gZ5KFhqqFfH2tu+t5CbvFn7AhUmMq+O19z9b2OoJnSUuMVoypInY8jPR07t
	 2Rte+d8r/Xuxg==
From: Vinod Koul <vkoul@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112174613.2101876-1-suraj.gupta2@amd.com>
References: <20261112174613.2101876-1-suraj.gupta2@amd.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
Message-Id: <179516885097.45276.12913506777592508035.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:50 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 12 Nov 2026 23:16:13 +0530, Suraj Gupta wrote:
> The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
> VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
> are only picked up by the dmaengine subsystem catch-all.
> 
> Add an entry covering the driver, its binding and its header, with
> Srinivas Neeli and myself as maintainers.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Xilinx AXI DMA driver
      commit: ecb0d76d28f79827896b242479f8cdd53e74cdac

Best regards,
-- 
~Vinod



