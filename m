Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=olGegtT2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCiBxPMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zdu6UqAiF7rTC1aAPngu4Lcf9W0UfVjpRUp67SpDNvY=; b=olGegtT20b13rutxZdw3ayiuZ/
	/NoSFyAHPiH75jUOTblLmlhQeH4pTBnlbb4Pg7wNUo28svRE/YQL9ULtdA1LfduxEhojJJrQCE26N
	fb0UFW7jfaGx5g+zBEAy9PAHHQb7jPzKqZmZ+oWzV44c5L/lJKr0+PDKfMKYEKjG7+q6UER588CDv
	jinOUaD8NTAq5ppAUMt+d/LawUFnXzLaxY3bbx/3eUQUI1bK/62znf6/R/fESsHLQfVR9QKNh1fSf
	/bsLEDr5s9D1f7KPAeOk2wjGkJu267m94jwD8lhWVR9uAX7qQMo1yH/E0NeCCkyZBZ7lFha+wJTQp
	8/VCDLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ2s-0000000DGmH-2cBL;
	Thu, 26 Nov 2026 12:57:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ2m-0000000DGjr-2ecD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:57:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A03641288;
	Thu, 26 Nov 2026 12:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE0C1F000C4;
	Thu, 26 Nov 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697864;
	bh=Zdu6UqAiF7rTC1aAPngu4Lcf9W0UfVjpRUp67SpDNvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JCiBxPMUkYBkMcC1aJRRzuQbERogqw97v/46zohcdy3xJMpwXTP9YRd+dqVQ2Vtfr
	 daziLHReeGFbbV7nGXDU5ujiwIA05VUT5XOEYPWYzmpSuKnUqSYtLNf74ixYQiSd5p
	 01DaBFFMPoiSsrp/UgagSdU47WtPdSujVD4dPcAmU4c3fp6SWFiSgBBHgQczqZdOYQ
	 in9l7KvCng9So6pbEsNRAr+LunBYJWU3A1jAe99pen8plegP+BjS9kMQp72W4ipfNj
	 b1wnWi1hTIREnr3iYwwIwBOmp/2BpD5e//C5z2bX1YmQ5Sfh0bS+Ub3nv8y/Xgic6K
	 XWCrkOTIEHCNw==
Date: Thu, 26 Nov 2026 12:57:39 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, mfd@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd/regulator: db8500-prcmu: Remove EPOD regulators
Message-ID: <20261126125739.GK38590@joneslee-macbookpro.roam.internal>
References: <20261115-ux500-epod-regulator-removal-v1-1-f550c95dfa9c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-ux500-epod-regulator-removal-v1-1-f550c95dfa9c@kernel.org>
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

On Sun, 15 Nov 2026, Linus Walleij wrote:

> Remove the obsolete DB8500 PRCMU regulator drivers.
> 
> Drop the regulator build hooks and the db8500-prcmu-regulators MFD
> cell now that EPODs are power domains.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Let's just merge this, it is ACKed and prerequisites are in place
> in the powerdomain subsystem.
> ---
> Hi Lee, go ahead and just apply this patch please.

Doesn't apply sorry.

-- 
Lee Jones

