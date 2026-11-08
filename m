Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2B606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ndot6KPs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iVdGLrJO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E3IORXjrOnxGaCWVGBDQ5fUa9toRWTCY+ybXEtyL0Pk=; b=Ndot6KPse6CU8FFmjzBORUj0P3
	fIMg0Si0amrTe5khqbxOtJWdm6Ahsli7bzCV/hdG8KkRG3LkNA/koz3ZKPCGUdkwSIsyDs3QenJ4I
	HTDvdV+yKfUWDmnBdGLZdSxc5CBNsWtJ22rM6bz+/KUuTI3BqFYM1Dj3QI6SH3NfQJ5lBvy+QjPjf
	f9dx+OFRyfFOvcmv2M1z7AOMuc0Au77VNy1g4OJ2KU3D6Q6antsxLEYPZhFrWmIV3Ts0S/ebUdaQR
	4xKlASqtl/X8ttJwB/b+INtD7qKbOLHUivtgG65nNP420gvBt3/ogvkUmndjNuTLw3mebaXNYDCif
	M8ZWREgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ87B-0000000GVDy-3Xkm;
	Sun, 08 Nov 2026 18:59:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ879-0000000GVDV-0m0B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 18:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794164375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3IORXjrOnxGaCWVGBDQ5fUa9toRWTCY+ybXEtyL0Pk=;
	b=iVdGLrJOSPsyVqKurRVvw7TMBUACIbtWjjjIf1FORlGuMKU3e4Ywid0285v0yniQ9hJKR9
	9bs7BxLVmjkVoL+i5jWmYujmiWYpxQgCT53lo5nGUidGXyzfBodphpTazW3NhQvGpvf6y4
	uDylDeiG3AmsjCdKa3Y5QPFG4wjoWnc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-chj8T669OIKhpmW1HkkHPw-1; Sun,
 08 Nov 2026 13:59:32 -0500
X-MC-Unique: chj8T669OIKhpmW1HkkHPw-1
X-Mimecast-MFC-AGG-ID: chj8T669OIKhpmW1HkkHPw_1794164370
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD24D1956094;
	Sun,  8 Nov 2026 18:59:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D7BB31956041;
	Sun,  8 Nov 2026 18:59:26 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  8 Nov 2026 19:59:29 +0100 (CET)
Date: Sun, 8 Nov 2026 19:59:25 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avDGjYYR6Tj1sVgP@redhat.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: mcCTYSt_8b2tBzQiDbIoYCkDVjBf__jkYphOYR1vtm0_1794164370
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_105939_298596_32DE964E 
X-CRM114-Status: GOOD (  15.08  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/05, Zhao Gongyi wrote:
>
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> +	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
> +	if (!info)
>  		return;

First of all, FWIW

Acked-by: Oleg Nesterov <oleg@redhat.com>

This change is "obviously good" and doesn't change the current behaviour.



----------------------------------------------------------------------------
But can't resist... The old comment was obviously wrong, the new one doesn't
look clear to me. It correctly explains why info can be NULL, but not why we
should not update orig_x0 in this case. May be it should just say that exit-stop
always comes with info != NULL?

Nevermind, I leave this to you, Catalin, and Will.

And I see another email from Will, I'll try to reply tomorrow.

In any case, let me repeat, the patch looks fine to me.

Oleg.


