Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B277E606A647
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T15U5HcQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=U9cA8/Ez
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mu1GS7zq5v7jKNMibYP5uLcrR4u8HWZVh4sY6q3AL0k=; b=T15U5HcQTAVNUm3jFsZLT+x5z2
	RoQZWO5vA7v8jJZRmGNDwFCnO3hArsfWy9e6XaIrZfvR2PYjGkbSS/IaXUc/YwFnzFfPRHRg2kGeP
	dFiPKxVNXx4qf86ENvLG2ZGie/lOicvsrJyHxj9ezaCiqhafi71GARHpMwwdhLxIPydpSl96TEhLY
	LsnusjSJj9DQ64XXWlOhTkwT6bMo22xyl9adSQF6faLTti0jr0JZlGdJ7floS1n8XBKTubE8Lr+YD
	3xvupSq53vkZ7X4lXnbBoOt2Thfxr2u+k/NHSoOr6bKJz29ty317WqapPJLmGZ27VsOwuZV1Epwrz
	6mY39ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Gq-0000000CW0u-10fp;
	Thu, 19 Nov 2026 15:41:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Gg-0000000CVvM-2Hng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:41:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6B31575;
	Thu, 19 Nov 2026 07:41:40 -0800 (PST)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DEC93F882;
	Thu, 19 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102903; bh=NlRRdYCCJGm99z73/IEGFJszgoLZZ9ZAh8xLUpvPMNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9cA8/EzyyfEhUEXjcHKkfM1oReVxnoPxYcO1CUKzLYOU5C8Ni0vDwbtS8QsL2dwV
	 ninSekApZxfIgtqV5OqNOxuPPVNrU/kTqsXZM2Zvl+YWTD8fuwyEUxVkv5YwbVC32l
	 kqSiWkDHU8eCcTQ1gbJj5e7jiplJektFVP0Pbe3c=
Date: Thu, 19 Nov 2026 15:41:33 +0000
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, cristian.marussi@arm.com
Subject: Re: [PATCH 0/2] firmware: arm_scmi: fix shared memory and protocol
 table
Message-ID: <av8YrXYoCi+ov/bK@e121740.arm.com>
References: <20261116123153.2672631-1-philip.radford@arm.com>
 <179509633637.1254008.1621228754406865513.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179509633637.1254008.1621228754406865513.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_074146_660945_3972F5D4 
X-CRM114-Status: GOOD (  14.40  )
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 01:55:17PM +0000, Sudeep Holla wrote:
> On Mon, 16 Nov 2026 12:31:51 +0000, Philip Radford wrote:
> > Here is a short seires to address two SCMI bugs reported by Sashiko.
> > 
> > Patch [1/2] slightly alters logic to avoid using an uninitialized
> > reg_io_width value when selecting shared memory accessors.
> > 
> > Patch [2/2] handles missing SCMI protocol ID tables in registration and
> > unregistration paths.
> > 
> > [...]
> 
> Hi Philip,
> 

Hi,

> Please avoid using bug report as subject line also. I have rebased the
> change on for-next/arm_fw/updates as I have moved files. Also I did
> rewrite a bit of commit message and kept !id_table check consistent
> across register and unregister. Please check the branch and shout if
> you disagree.
> 
> Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!
> 
> [1/2] firmware: arm_scmi: uninitialized reg_io_width in shmem_setup_iomap()
>       https://git.kernel.org/sudeep.holla/c/8db620083cf2
> [2/2] firmware: arm_scmi: null pointer dereference in scmi_protocol_table_register()
>       https://git.kernel.org/sudeep.holla/c/99e55aac0f9c

Noted with regards to the subject line, and I agree your ammendments
look cleaner.

Regards,
Phil

