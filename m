Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hbp0PFJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qfVG+9159819Kzvw9diB4DBZrJSQoGD8HuiVS/PJANk=; b=Hbp0PFJg15DGkbeYQX9u0sXB2T
	HaUrZ9L1pm38diulNsKZaHwM6kRaunbipDBiByOpKSYYPkK7kUXvL9bZdQPBW/mnWHlnjN8NfRrvE
	6eBot/b8Kc0E5jsH6j6LdRb/kDt8IPIwhp1qbN96C0IRNNbZ8lVgIIRvAaqn6C3Nd9NbrwgaV2lHy
	ml86pKI2oItSEE1BJzbTYlxRJH1x68vn5tO6RAAO1ZSz/sR/klcSmZEWSVLSdWnTq6/lTMpj8jHCQ
	289RyqZqegFeEu7MYdOzjnuJHVrGUfuGLz76LObZAars/bxvDvs5ihXLbX1wNqWLXsMfoHnJU6oR5
	EA5FUaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ0v-00000002eoe-1tPp;
	Mon, 23 Nov 2026 09:07:06 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ0a-00000002enC-15ob
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:06:56 +0000
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 74CE4244C20;
	Mon, 23 Nov 2026 10:06:42 +0100 (CET)
Date: Mon, 23 Nov 2026 10:06:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Will Deacon <will@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/sun50i: Report TLB invalidation timeouts from
 iotlb_sync_map
Message-ID: <awQCEz3ip1AwDBjR@8bytes.org>
References: <20261020170324.1223144-2-oss.patchbox@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020170324.1223144-2-oss.patchbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_010647_945750_42C2C1C2 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 01:03:11PM -0400, Yuho Choi wrote:
>  drivers/iommu/sun50i-iommu.c | 42 ++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 16 deletions(-)

Applied, thanks.


