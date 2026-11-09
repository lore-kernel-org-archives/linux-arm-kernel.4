Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4YnpNv1A;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HmtQcYbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J5dhqbhYXQcY38/MwfGJS4lj6d8vb41ZbZA9Qsq+Ke8=; b=4YnpNv1AMDzlvLAQD9PunMxkvI
	vdy7Pd1FHO5fT8B9qndffK9l6nQXRCsTxxpUMcLVZ8euy52awcBVFcZn6ScNbU/vLcb9sOgZ0WlWY
	+6VysIUJuHMeoXsxjrOOE6KCtP2fRyHTkI6HXcOMU4NB52Z9e93VLDqGF2See3nWhkM7VRx+AglqE
	+ud4uq+kNwjSt0bWYtaYBX5FXs/UoBfS/ETR+X9rLxeKV1f2PzncF0wpgdsVh8PlQATLQ/oeho8nd
	+iLkQqyz4BCXnMwXiTSwpZSXOsLS4uZGRwoaj1I1bcDOArA+GyZ1YjSTu0y0qH3DwR4WKkU8K3ALV
	SYxUH/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNGa-00000000UkS-1eaO;
	Mon, 09 Nov 2026 11:10:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNGX-00000000Uk4-1BRn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794222619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5dhqbhYXQcY38/MwfGJS4lj6d8vb41ZbZA9Qsq+Ke8=;
	b=HmtQcYbkerMqLCHkiGRYjpTkZ//01rWEtDH1vZITTBgbc/22rYAJTChaDlL9fOkiuEKFes
	7Wa05ZjKVN2ogbVCDXnXamn43NI5y6EK12yFMQRnSaEIpLS1vwMn8A5LR4DhUkjJqKkn2+
	IhqeO/gd4y1sgfdfFjgVessw319uFCE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-Xslz7O5XNmCcEFKJy99xCg-1; Mon,
 09 Nov 2026 06:10:14 -0500
X-MC-Unique: Xslz7O5XNmCcEFKJy99xCg-1
X-Mimecast-MFC-AGG-ID: Xslz7O5XNmCcEFKJy99xCg_1794222612
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13F911955F6D;
	Mon,  9 Nov 2026 11:10:12 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7CF551800480;
	Mon,  9 Nov 2026 11:10:09 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  9 Nov 2026 12:10:11 +0100 (CET)
Date: Mon, 9 Nov 2026 12:10:08 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avGqEOamCMLjOD8i@redhat.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
 <avDGjYYR6Tj1sVgP@redhat.com>
 <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7fb3d264-ada7-4dfd-be21-05ce370686a0@bytedance.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: krbVwvOrAlRPe5VY2gi0XGgyunE2awpIVpZMTFf--fw_1794222612
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_031021_419934_4A9802F1 
X-CRM114-Status: GOOD (  16.83  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/09, Zhao Gongyi wrote:
>
> On 11/9/26 2:59 AM, Oleg Nesterov wrote:
> >
> > ----------------------------------------------------------------------------
> > But can't resist... The old comment was obviously wrong, the new one doesn't
> > look clear to me. It correctly explains why info can be NULL, but not why we
> > should not update orig_x0 in this case. May be it should just say that exit-stop
> > always comes with info != NULL?
> >
>
> You're right: the comment explains why info can be NULL, but not why we
> return. The early return is intentional: it keeps orig_x0 unchanged
> during a non-seized group-stop.

Yep, this is what I meant. And this looks confusing to me. Lets suppose that
the tracee was stopped because of JOBCTL_TRAP_STOP. Why should the behaviour
of update_syscall_orig_x0_after_ptrace() depend on whether that tracee is
PT_SEIZED or not?

IOW. To me your V2 looks more understandable to me, I don't understand the
Catalin's concerns.

But then again, I can't really argue, I know nothing about arch/arm64. And I
do remember that I tried to confuse you when I reviewed your V2 ;) Thanks again
for correcting me.

> I'll wait for Catalin and Will's thoughts on the wording.

Me too.

Oleg.


