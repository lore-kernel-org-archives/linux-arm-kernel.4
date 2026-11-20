Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2472606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 00:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abo+daqW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiPY5lGS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gI/HAxY3WhDAs8lNFwumSDS3oIINRL9PydS8G9/9+aA=; b=abo+daqWJjAuZm
	lQmV3XYj64+TQlvgPGeN0Y+4ATks/uc3dZo1t+PkdvP+9IbB3chS344zyZ/TOvF5LKMliJyjM4AQP
	/J8mOZGdZPmlkZjVw9lAEc/2f6cBV69xEKLeiuZdqyj8rZ8rPMBgqe3ZrWkvk/haZb+XOu6Zd6LsN
	KIZ/HtzBM8gOabWNdCBpbXK6rlGv6IR3j34kvBApeQe0B1J/Q/1xmyxLtAxEVyYuqxV7cU/cXJRCb
	P1/a+n/eS7A/Ro9MpJrwDNG0DYLD/8ehqYQEVa6WruX4FeT1J4FwFEvJ63tqg0EPZ6LBq26MP8c+d
	kgklRPRpVppVmDHhWQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCja-0000000DmAE-2nRh;
	Fri, 20 Nov 2026 00:44:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCjZ-0000000DmA0-2674
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 00:44:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D0FB4421B;
	Fri, 20 Nov 2026 00:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883861F000C6;
	Fri, 20 Nov 2026 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135449;
	bh=gI/HAxY3WhDAs8lNFwumSDS3oIINRL9PydS8G9/9+aA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KiPY5lGSR9qj9vmXhooEstVBQhgrSk9V/3CeriRzXMiT/Y24jYpyCcu7R5Rgycral
	 NX4otO2a9ZoqnQzn0wx2kLd528js/ER4ZBhM50kutybLjb5dnsziVFlCrgoLj+ATlz
	 bncrGZhW5H9+vaHzytaXf4MT9CegtRxynrS5Y+OHxKnf2kxIb+Uk20cicwwCQKKOi2
	 AWNCg3fG7w50Jp3lZV8YQcfY4C+hH/w8A9DOOmL1iT2ljWdiVy7ufJSKEehiDelB0V
	 bbUfEdKnlBVhnqOrHRW0otsUKoAJv9s0YjtESLo8Bryj7Dafs4xMMGtLxn3riVGEuM
	 Epyh4IX8npE1A==
Date: Thu, 19 Nov 2026 16:44:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
 <philippe.schenker@impulsing.ch>, <devnexen@gmail.com>, <horms@kernel.org>,
 <jacob.e.keller@intel.com>, <pabeni@redhat.com>, <edumazet@kernel.org>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, <danishanwar@ti.com>
Subject: Re: [PATCH net v3 RESEND 0/3] Fix switch mode for offload and
 non-offload cases
Message-ID: <20261119164407.1d2b3fa2@kernel.org>
In-Reply-To: <20261112102140.2744508-1-m-malladi@ti.com>
References: <20261112102140.2744508-1-m-malladi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 15:51:37 +0530 Meghana Malladi wrote:
> v2: https://lore.kernel.org/all/20261027131732.3411403-1-m-malladi@ti.com/

What changed in v3? When was v3 posted (since this is a repost?)
You are expected to reply to the sashiko review, even if just
to confirm that it's correct.
-- 
pw-bot: cr

