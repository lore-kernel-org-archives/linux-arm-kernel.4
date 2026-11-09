Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60490606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=brHzvALe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUgEKHPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5LOD1jU9FVWtN/u7Dr95LgfC3DhNMyl6S5MdxkkX0i4=; b=brHzvALe6JFcL0eZSiWIvPO37L
	+JDmc1Zrz6L4Qxebii4kQ5jB0X3ka6yN1+ZooUcohlzuC/v3EAJZvd24pGJDlza4jjOI+d0iFHA/J
	tMRNRZt/pjKgYw4dYxSGaYPA4VDMX05wvOvwgVckBkGLGu/5VcmQU+vET7b+BhxdTVO9IwtfhIqri
	1xsvns9q8m9nrmNCSXB0I74B2WtNLOz9y0g6yvOkaFfP1ObiYTR7GdP2949PBH0FIOMWNhPQERYuD
	CIk6Xn7ILeDFzs1eTsKxgLPVtrwRhD/Ev0RENzJviuTf4c09fl8GLvkGds0RWY71uEkCayDKNyNHy
	TZxYSGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPeq-00000000rGJ-1pK4;
	Mon, 09 Nov 2026 13:43:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPen-00000000rFd-1TGq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794231811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5LOD1jU9FVWtN/u7Dr95LgfC3DhNMyl6S5MdxkkX0i4=;
	b=MUgEKHPdpdY+MauCyyfi+K1dq8sWYDRFd+Mj3hB+wehCMy/VVFesw0aVtYfLddZZ/I0qlo
	WmkkTmR7JkfLbpZ06IDV6kh+bOTDfduE8cW2TWYvvxE4g9ixUbjzL/MW92wxk+sHm9a1/U
	f6BYWFUDiTd8nl9AiIaW2AKd8gVf6W8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-wmxFZKqpOeOFcD0PdaIabQ-1; Mon,
 09 Nov 2026 08:43:28 -0500
X-MC-Unique: wmxFZKqpOeOFcD0PdaIabQ-1
X-Mimecast-MFC-AGG-ID: wmxFZKqpOeOFcD0PdaIabQ_1794231807
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75D421955F0E;
	Mon,  9 Nov 2026 13:43:26 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B11AC1956089;
	Mon,  9 Nov 2026 13:43:23 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  9 Nov 2026 14:43:26 +0100 (CET)
Date: Mon, 9 Nov 2026 14:43:22 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avHN-qWRu--arO8a@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <aus7mMS4tXAzPCSi@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aus7mMS4tXAzPCSi@willie-the-truck>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: gHrofnmOB0inXXP8lx-GMDlf6z8FPP7qOnzhUTz-M48_1794231807
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054333_491124_C62CD3E1 
X-CRM114-Status: GOOD (  21.51  )
X-Spam-Score: 0.5 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Will,

sorry for late reply, I was on PTO.

On 11/04, Will Deacon wrote:
>
> > > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> > >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> > >  	 * return value of the system call.
> > >  	 */
> > > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> > >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> > >  		return;
> >
> > LGTM, but I don't understand this arm-specific code.
>
> Welcome to the club :)

Thank you ;)

> The original rationale is described in e057b9477232 ("arm64: syscall:
> Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
> helps to set the scene.

[...snip...]

Thanks for your explanations. Yes, I tried to read that and other commits.
The only result is that I've managed to convinced myself that more or less
I understand why 88b839ce497c and 5a87e8c7f3702 make sense.

> So that's the mess we're in and I'm all ears if there's a cleaner way to
> sort it out without breaking anything that relies on the fragile semantics
> we already have.

No, I can't suggest anything better. I think your patches and the fix from
Zhao are fine.

----------------------------------------------------------------------------
Now the question...

So we had CVE-2026-68171 and then it was rejected:
https://lore.kernel.org/linux-cve-announce/2026081123-REJECTED-f1f0@gregkh/

Now we have another one, CVE-2026-90347
https://lore.kernel.org/linux-cve-announce/2026091703-CVE-2026-90347-6f2c@gregkh/

Why?

To me the problem looks minor (security wise). Yes, a malicious debugger can
fool seccomp. So what? What is the real problem from the scurity perspective?

Oleg.


