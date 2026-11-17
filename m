Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QAY73aig;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uQLS4+jt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SlG7QLB1kJzkI8H5DG02stBipiVu0CjDAuInDuzsrOs=; b=QAY73aigPqH8TvOYTDta2HvjT+
	InALwUOGCnZgTj8wJGZcCbJoYyfFnAJVd77O2BPRrLCXMK/CPubye2mmOSiej+JcXwRCGWZ/EzJNz
	01TajR7z3EseCEAVxQLitUK3RQ3F6gPume5qV2Lw7kouc/e6STaQbK5kO16iFPcOudzQ6NLWtWHJO
	zSlI9hJHf1eWbXUuT9WbJRQb5hxNVobOFvoJTLgLt7I8JXDs5vNB3MG7nFmt3ebVQU0AQAnrwoUdD
	D4dEpMCBUW3HDWIm8bqWWRkM/dBVZKV084EcRK+g6OG2KYS09QJReTcUjcwdUuIxK7wfEzFuMAaHk
	eoaEW8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNGp-00000006g86-0lgo;
	Tue, 17 Nov 2026 17:47:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNFt-00000006fsW-3zWo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:46:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0281A00;
	Tue, 17 Nov 2026 09:46:01 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 790703F632;
	Tue, 17 Nov 2026 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794937564; bh=NtQj8MNCnhvZNvOKcp20IxPx6PzYni3ArIZnYqISPiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQLS4+jtKeL+VWPwFB7KD+ijfK5bsFdh6jcei9p++JhjdTH5twkyk2rjtE0VjeJKX
	 WbJ69WshCKRQq6OkrwKT7zPQzcQ3uXYNCOKNaLQPHVJNgYuHIYjUZ34XI31hEUxtlS
	 ya2sdIDWkywrPkXXVAuR9GgYar6qaPhH58MZ18Xk=
Date: Tue, 17 Nov 2026 17:46:00 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, philip.radford@arm.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
Message-ID: <avyS2OLs3XGcKXXn@pluto>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com>
 <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto>
 <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
 <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094606_144016_0BE1219A 
X-CRM114-Status: GOOD (  11.65  )
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

On Wed, Nov 18, 2026 at 01:35:04AM +0800, Chengyu Liu wrote:
> Hi,
> 
> I think the current v2 may have reintroduced the second deadlock
> described in my original commit message.
> 
> scmi_forceful_work_func() still calls unregister_reboot_notifier()
> while holding sc->state_mtx. Could you also check the potential lock
> inversion between state_mtx and reboot_notifier_list.rwsem?
> 
> The reboot path holds the rwsem read lock while executing the notifier
> callback, which then waits for state_mtx. Meanwhile, the worker holds
> state_mtx while trying to unregister the notifier, which requires the
> rwsem write lock.

Yes indeed Sashiko complains about the same and the second part of the
issue on the rwsem is unresolved and will need more work.

Thanks,
Cristian

