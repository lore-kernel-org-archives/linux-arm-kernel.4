Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9/Wy6m3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDmtqeeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v84rwLUr25OsdKhfYlEQQtUOuFRbWdYS9QsBPOZ2Rew=; b=q9/Wy6m3dxKpAk1rpsyooJYcZU
	EUsWdZFMUMChZKTbtN4LnQndBQyVetxnqgQ1qyfToBkNKqvugVuNRIexR8d0vNeyG8fCnYxcDXPLq
	TzqUEPKqhfA1xFsWL34SkTUXmAXDkIg46W9vm+iztEuuncX4lJNGjmnHfuyg80FjHO7tX6WZD+bdZ
	rmZ7IhU0/TI8rwu/tYF7Vo7mBwyYSkqG32Nk8Zb9u8kXeQpiXtvkVH1D+dyiJbmc6e3K3ueI5YJ2G
	4wREnKgsAIagm/Img/t3H2Dcy8nxS8fwYINCEY2EgRycBDsubpE9DcNX5wC1JSMggemslAo6E82dj
	FIDQXzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUda-00000003gVb-2iiy;
	Mon, 23 Nov 2026 14:03:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUdZ-00000003gVT-0IpV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:03:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99CA9446AE;
	Mon, 23 Nov 2026 14:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA071F000D2;
	Mon, 23 Nov 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442596;
	bh=v84rwLUr25OsdKhfYlEQQtUOuFRbWdYS9QsBPOZ2Rew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lDmtqeeuRE43Ga0cQ6xRV79FwlCK8D3B5eHPs+Jj2zzsnkjiqt4RzfH4809UHyIdL
	 cNsWjZtW8OWXJXcP2+fdkKMKU96baxL0w5t5eBYdTEgfE7r5wubZUnt5T5FQaBeqCA
	 1rFHGzeTGnSWzh6ClzkOT9IJZ7SGofit0IoQoMUDSvHiKCVwwLG3zmu/UGhcNN7wIU
	 /WFGljuVVoCHERBKl97YQnAQpYyJg34bXutSAyhw02Z+socydWJBw0fNDXW090uxWJ
	 Mc39edk8AXWxRLzI5geOYBsehacU5G/n6shRUp/4d86Dn/n314PFDJGi5p/4gxxCy3
	 biAuGUc3BRdMg==
Date: Mon, 23 Nov 2026 14:03:11 +0000
From: Simon Horman <horms@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	michal.simek@amd.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND net-next] net: xilinx: axienet: Derive RX frame
 length from residue in dmaengine path
Message-ID: <20261123140311.GB31322@horms.kernel.org>
References: <20261117060757.1767493-1-srinivas.neeli@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117060757.1767493-1-srinivas.neeli@amd.com>
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

On Tue, Nov 17, 2026 at 11:37:57AM +0530, Srinivas Neeli wrote:
> The dmaengine RX path derived the received frame length from the descriptor
> APP metadata. That only works when the optional AXI4-Stream status/control
> interface is present, because the hardware populates the APP fields solely
> when that interface is enabled. On designs without it the length read back
> is invalid.
> 
> The AXI DMA engine already reports how many bytes it wrote into the buffer
> through the standard dmaengine residue mechanism. Compute the RX frame
> length as the posted buffer length minus result->residue, which is
> independent of the status/control interface and correct across all designs,
> including multi-descriptor frames where the residue is summed over the
> chain.
> 
> Drop the descriptor metadata lookup, which was only used for this purpose.
> Detect a failed transfer from dmaengine_result.result instead of the
> metadata pointer return value, and remove the now unused LEN_APP macro.
> 
> The transmit path is unaffected. It still passes APP metadata for checksum
> offload and derives its length from the skb.
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
> This patch was originally posted as part of the MCDMA series:
> https://lore.kernel.org/lkml/20260818174151.1608971-4-srinivas.neeli@amd.com
> 
> It is independent of the other patches in that series and uses
> existing AXI DMA residue reporting to calculate the RX frame length.
> Since it only modifies the AXI Ethernet driver, it is being submitted
> separately to net-next.
> 
> The previous standalone submission is available at:
> https://lore.kernel.org/lkml/20260929081316.803997-1-srinivas.neeli@amd.com/
> 
> I responded to the netdev bot feedback, but accidentally included
> the "pw-bot: cr" tag in my reply, marking the patch as Changes
> Requested. I am resending the patch for maintainer review.
> No code changes since the previous submission.

Hi Srinivas,

Unfortunately CI could not not apply this cleanly to net-next when submitted
using git am.  And CI stopped at that point.

Please rebase and resubmit.

-- 
pw-bot: cr

