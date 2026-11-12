Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBC0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJgf+0sY;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=rKO6UlgH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XrKTCTtL8bq9hcA3cLjorZe3ms1NOePAubxkA7gxev4=; b=cJgf+0sYWChe5G
	bQmvBN/FbelY0ofg8Lf30Io39VHD/IFkv6ET5qa8N6N6zKIbYBCFdkU7TBIZ4P5H0VWwQFd17QBcM
	lv5mR/2B+lN7j5Kfz3BkSQF1e7Ep2ld93TArrIN9/ymEfOOegrpg7WbBhy7SOUiVED7h3+cXjZrkS
	DoX1AWVt5I5r4qKkKu/LQxFgAkS3zjWG9LTe7qnaRWVi89f3gS+56iXVS4IIAqTf/jROToeYp8a3X
	Xrv8wsz1l848ybB/weQlWS+lbRV008Bvo4XWoICqQgN/pFz03179y0wDxacv/b38IiCczxgwuhkYL
	sDdJ2smdzheBI9ra161g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR2M-00000009MJx-25i3;
	Thu, 12 Nov 2026 09:24:06 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR2A-00000009MBg-2Vzp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:23:58 +0000
Date: Thu, 12 Nov 2026 10:23:47 +0100
X-Lima-ML-UUID: 4d878238-c034-4480-8c6f-18f3801a77d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794475431;
	bh=BJYPieYsm7wUZfSPxCoK9/u1+dJEmmjdYYatgOil7Uk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rKO6UlgHTeEb/toXHmvy2QbTBq1wVmOxoEXGP3+1BMuVeelvgS6jdhStcSMY7jeby
	 ZDeSjg5eVFGMsHeCSUDTsXFfgKrSnXofhlrucgBZdYsV78UDUL5KFYjmvkNBM0rzSb
	 u9j8TntSRhJe8TLw0wklEJOpinv+V0lwZGVbSK/FD9YMMEkcNpxj1l/bMXCKlnmhL1
	 t3n6TTEydlQPYPV6bJl7LkKEak2e/4wqiNw/GUd86A/LdvGKXLR5mgLJWZmdItbZeG
	 EzIG99XyPS7eztr0E7QwUvGdalp7M/mcdEzWWDSmPgjuVNfewMbJJzmOeO8tvXHhjV
	 A8o9Hn+lV9LEQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sven Peter <sven@kernel.org>
Cc: j@jannau.net, neal@gompa.dev, marcel@holtmann.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 luiz.dentz@gmail.com
Subject: Re: [PATCH v2 1/3] Bluetooth: hci_bcm4377: treat only negative
 hci_register_dev() returns as errors
Message-ID: <20261112102347.3a22966a@kait2en-mbp15-1>
In-Reply-To: <517d9d36-ab3f-4eb5-8908-f50aea59a3b0@kernel.org>
References: <20261111120248.21062-1-dev@deq.rocks>
	<20261111120248.21062-2-dev@deq.rocks>
	<517d9d36-ab3f-4eb5-8908-f50aea59a3b0@kernel.org>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012355_093462_593CC339 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 17:29:01 +0100
Sven Peter <sven@kernel.org> wrote:

> Please make sure to pick up tags from previous revisions or mention
> why you dropped them. I added Reviewed-by for v1.
> 
> Sven

Sorry, I missed it when preparing v2. For the record, from v1:

Reviewed-by: Sven Peter <sven@kernel.org>

Luiz, please take it along when applying, or I carry it in a v3 if one
is needed.

Andre

