Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5254C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oS57Xe/P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqULsYEt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d2xN15dj3gCvbJHEB+TEBgOrVQFIeke+Q9K2cfCpikA=; b=oS57Xe/Pl/bWBngqyio3b4qoCn
	CQVcT7B6Z5D8W46dWSeFpAlCAR4uJuRk2Ubtm5rG4dswo+nZXLDN5Py3T7vrs13ZgFdBLc8aIFg+s
	G+pdLd3SCS1QLpd0tEswnMoOToTwJNsPzpCWg7qMwNyvBo1OaeKnOpULr0ipkMDu207f4dM3UFA+5
	qlIEYwaOjMyyu3aW/2Ir8+JiU1rkC8bypuIQI86PFJMv9gZ1Pt/fbOAFRlTydf+UhEDxLJotf0Htm
	Y1jSy2N2nWrZhF1F6WA7xFY7V8qwyqOVDah9J2hIObgDbFnFmAZu/FNmZ5nHq7+Dl0XTI/iyp9bm6
	goIgDV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNuW-00000006lBF-1sb0;
	Tue, 17 Nov 2026 18:28:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNuO-00000006lAt-2EX8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B972360DE9;
	Tue, 17 Nov 2026 18:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340431F000C4;
	Tue, 17 Nov 2026 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940075;
	bh=d2xN15dj3gCvbJHEB+TEBgOrVQFIeke+Q9K2cfCpikA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqULsYEtt6CVaxlO9mQ6ePjg54L1qfwjVAX9O2MIZTa/dE0PKcBqvpx05FKgSVh5+
	 8JYLEdhpMkz5k2XlhWPYRuija2Xqm8oC/Wmg110tvZCjq2JqblBUP5aLUrY/z7J1LR
	 i4T7gU3FFD5E7EQpxZ7b15/60fdvrPCatwaKUO7PZ1QCWW3esoGE960t8aoT2vn/Sp
	 etj5+atmpx4h2AyUYebq5tPIl49tk4Z9pZ9os1a3dib+Uan4/Yy2jly+jjdkp5os/z
	 wq2Pr4qCj7UcJB17/2DLrYP9+UnmHZOxg5SmSrmnYUoy4dyX7imNgrprxXTJd3TLXr
	 8Hlx2DJdXTB9w==
Date: Tue, 17 Nov 2026 18:27:52 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Chengyu Liu <lui2012qwq@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	philip.radford@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
Message-ID: <20261117-hypersonic-beautiful-perch-bd4fcf@sudeepholla>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com>
 <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto>
 <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
 <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
 <avyS2OLs3XGcKXXn@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avyS2OLs3XGcKXXn@pluto>
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

On Tue, Nov 17, 2026 at 05:46:00PM +0000, Cristian Marussi wrote:
> On Wed, Nov 18, 2026 at 01:35:04AM +0800, Chengyu Liu wrote:
> > Hi,
> > 
> > I think the current v2 may have reintroduced the second deadlock
> > described in my original commit message.
> > 
> > scmi_forceful_work_func() still calls unregister_reboot_notifier()
> > while holding sc->state_mtx. Could you also check the potential lock
> > inversion between state_mtx and reboot_notifier_list.rwsem?
> > 
> > The reboot path holds the rwsem read lock while executing the notifier
> > callback, which then waits for state_mtx. Meanwhile, the worker holds
> > state_mtx while trying to unregister the notifier, which requires the
> > rwsem write lock.
> 
> Yes indeed Sashiko complains about the same and the second part of the
> issue on the rwsem is unresolved and will need more work.
> 

That's what I was referring when I said
" ... re-evaluate needs_forceful again here after un-registration before
  calling below forced transition ?"

But then your response somehow convinced me that it is not needed 😉.

-- 
Regards,
Sudeep

