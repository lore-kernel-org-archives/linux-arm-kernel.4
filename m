Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEA60A2614
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=baMaVpjp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JWVFmd9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q47HBnsBXsh2bthirykI6rD+fkcQs2OaoEr05am18HI=; b=baMaVpjpjCJzNAcp7c5syz/BlE
	yO0M84wOHA9pLpidJNq/9yZD1NZxZ+wpDFHAC5E3dQNOfyMm3bQ0F/JqRRHyeA8X3JfeDV5G/DoBF
	vvlShPy85ibrvgH/UCT2m+bIyNk+iHMIBy/rw3CKo3Ne7HRx6DLFpRKPicXEmI58tpLcij/ITG5nK
	V3u6by0aB1Yb23k4CF7RtFJ+nh4d7vYGCAqL8UMjCi6nn6vYvE/Oxr8O7UusA2VCnVCMjh6kDK564
	BlvvafyAPGg2az9s3iRUMxHMEu6WjUKKJxD+/S4vmVUV1GE7eWu3YsjvH3a97lsSJqFvTuPtk6lQU
	5LHe0cwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkfR-0000000A1N1-2wLn;
	Wed, 18 Nov 2026 18:46:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkfP-0000000A1MT-06ia
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B61601477;
	Wed, 18 Nov 2026 10:45:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330113F673;
	Wed, 18 Nov 2026 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795027557; bh=RgXpgp1b64sl9UfssU3kG9kquYvtoA69zMUuuOQNjXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWVFmd9+3yNomI/qoopkleACN5TNxUN3On+VVyud7IpUCc/SG+Ig7dye/VtQj3Gz+
	 XscHeHYR6bZSkFh7ZNolGXymS8NH5Kbskz2yOHb3ZSiVXRIV0xMb2DzwXo6Pfv+j9w
	 MozS/n6dl2ICb40gnwWiNxAS4XWK/eIpmthc0otc=
Date: Wed, 18 Nov 2026 18:45:51 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Chengyu Liu <lui2012qwq@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	philip.radford@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
Message-ID: <av3yX-5WUt8bT8Jg@pluto>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com>
 <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto>
 <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
 <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
 <avyS2OLs3XGcKXXn@pluto>
 <20261117-hypersonic-beautiful-perch-bd4fcf@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117-hypersonic-beautiful-perch-bd4fcf@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_104559_132970_DB233D44 
X-CRM114-Status: GOOD (  17.93  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 06:27:52PM +0000, Sudeep Holla wrote:
> On Tue, Nov 17, 2026 at 05:46:00PM +0000, Cristian Marussi wrote:
> > On Wed, Nov 18, 2026 at 01:35:04AM +0800, Chengyu Liu wrote:
> > > Hi,
> > > 
> > > I think the current v2 may have reintroduced the second deadlock
> > > described in my original commit message.
> > > 
> > > scmi_forceful_work_func() still calls unregister_reboot_notifier()
> > > while holding sc->state_mtx. Could you also check the potential lock
> > > inversion between state_mtx and reboot_notifier_list.rwsem?
> > > 
> > > The reboot path holds the rwsem read lock while executing the notifier
> > > callback, which then waits for state_mtx. Meanwhile, the worker holds
> > > state_mtx while trying to unregister the notifier, which requires the
> > > rwsem write lock.
> > 
> > Yes indeed Sashiko complains about the same and the second part of the
> > issue on the rwsem is unresolved and will need more work.
> > 
> 
> That's what I was referring when I said
> " ... re-evaluate needs_forceful again here after un-registration before
>   calling below forced transition ?"
> 

I know what you mean... 

> But then your response somehow convinced me that it is not needed 😉.

..but I fooled myself too O_o

Thanks,
Cristian

