Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VDypYWSO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj2kd2mr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O+pgZRkLfgW76WfPn4Fu1hBgK+w5b2BaREwIb7TD89Q=; b=VDypYWSOxzlHFA4/VWtMlcrXca
	UxdyzB9S1x5RiOEeYDx5UPx3pgDgftsFSDZlL9S4ErarS7azNjJBp0y6qjF2QNmENB1H4sHoPPugf
	9SMIUmH06fc0Rx+2qj+F2ntfpDyy2yhhnlqpp8erM8H48kd5DfUxM8WaEiA9xSKrpIEfy9N1QmkcN
	rLMhqsXn8hOjVMyApjPGTg94w1wBjDAOPO4iFxx8oyliRqA1igGQ+n8h/0CB0sSpW16zeSavszx07
	SvfiMxiwc3AmHRi2ytUSp6LVayuwxLMQDoweiiVyti1yWYwi80fg+vBc1FMTY+WIzqUfJ6yXxubrK
	KwLPbfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXB6-00000004Eqp-1s4P;
	Mon, 23 Nov 2026 16:46:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXB5-00000004EqT-33WI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25F50446CF;
	Mon, 23 Nov 2026 16:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078401F000C4;
	Mon, 23 Nov 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452362;
	bh=O+pgZRkLfgW76WfPn4Fu1hBgK+w5b2BaREwIb7TD89Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oj2kd2mr1otfPzk7UR5j2KPPMDKuamxppQLR44O8kjGO5HH39M+rDAo+ucd1/v0kw
	 SgykX7jauACdB8vX9Yjexby8QlXocvRgwGW1M95vGS9DGU5NnZCzC4PCs7cn2P9yVj
	 w9Ke4U4bVj7pnKe7YYltTVoy3KtntJDrjUZneH59rvF0Y/QJCHjsPDc8kW/iNmPMMj
	 BNZHjUwgt8frnSjdapRY5ahOYtGHEv/Wvtv/lPPy/jNgQ32z63r8cM4oRVLeN9if0K
	 qxFhEDnb1x47JmcNMvq1bOMU2mHGxauT2st+RNbQaVCdCWyYntAKxVy56skA8AVOGd
	 JObfftlgBb/Wg==
Date: Mon, 23 Nov 2026 16:45:59 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Omkar Anand Kulkarni <omkar.kulkarni@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, james.morse@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] mailbox: pcc: Use threaded IRQ for shared platform IRQs
Message-ID: <20261123-imported-dainty-chicken-6409ac@sudeepholla>
References: <20261123161231.3912629-1-omkar.kulkarni@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123161231.3912629-1-omkar.kulkarni@arm.com>
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

Hi Omkar,

Next time, please use get_maintainer.pl that would list proper lists and
maintainers.

On Mon, Nov 23, 2026 at 09:42:31PM +0530, Omkar Anand Kulkarni wrote:
> PCC platform interrupts can be shared with other ACPI interrupt
> consumers. One observed case is a PCC platform interrupt sharing the
> same hardware IRQ line with ACPI GED.
> 

Hmm, interesting.

> ACPI GED requests shared interrupts with request_threaded_irq() and
> IRQF_ONESHOT. If PCC requests the same shared IRQ without IRQF_ONESHOT,
> genirq rejects the second registration because the shared IRQ users do
> not agree on oneshot semantics.
> 

Fair enough.

> Commit 673327028cd6 ("mailbox: pcc: Remove spurious IRQF_ONESHOT usage")
> removed IRQF_ONESHOT from the PCC request because PCC was using
> devm_request_irq(), and IRQF_ONESHOT is only valid with a threaded
> handler.
> 

Indeed, but ..

> Fix the shared platform IRQ case by requesting it with
> devm_request_threaded_irq() and IRQF_SHARED | IRQF_ONESHOT. Keep
> non-shared platform IRQs on devm_request_irq().
> 

The issue is multiple PCC sub-space can share the interrupt line.
By moving it into threaded irq, access to the IRQ related registers
may need to be protected which is otherwise not required and is totally
unnecessary. I need to think through it to see if it can be done just
within the handler instead of register level locking.

Or am I overthinking here ? Let me read the code, PCC part of ACPI spec
and think.

-- 
Regards,
Sudeep

