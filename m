Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B561606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKZzD6bp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Hg1ftMob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B2fAROAP6MruPfjc+7f9HUJjQbFHniTn1Skfby8n/LY=; b=sKZzD6bpE7JRkau9kPuU/30PvV
	dk/4JvLkPMvRM7gt2Qs1sLKWzd2M1zapXkwz3m1/ojtqKQAfwzf3ZfYPWm0DnXopc7cb49GSs0a7Q
	PLEM4znUCMypq7bN++J/beX4UmGcstvfj8I8f5llm8aQk5ygFyW8xxh151bJ86gGj1Ii61Ob/SRde
	ySpUxZ33jTRm9Y+MW9dtK1myL6fFlbLBKRAL0vFRsy4UN+oNagqvUwIQJncc0UQmTaZf7KpkoCUUZ
	Gp6H24E7qfP+D8bMO02FFbtaT/qNqUmUJOQ2ITxMG10Olv1huJSo3/t16RGuMQj0As7vnQsoWlhPW
	avaEWTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv2q-0000000G7pv-3jvi;
	Fri, 27 Nov 2026 12:27:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv2o-0000000G7p9-0LIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:27:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25A91756;
	Fri, 27 Nov 2026 04:27:09 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3215C3F86C;
	Fri, 27 Nov 2026 04:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795782432; bh=B2fAROAP6MruPfjc+7f9HUJjQbFHniTn1Skfby8n/LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hg1ftMobmuAVrlACTrjess/8tIaUF2GwLLJdpJHQCPhbUePzWOHne4HDkIJRfwYMe
	 uQ0P9wHnvQPxd2gNz0R/R2zG3NUQyENOZB87ollgIs08R9RLOAEr5VmNFISH1B5/lV
	 2vXD7npgYblCKvNX+9rXSwA7/OPMSkWyqS7xtRf0=
Date: Fri, 27 Nov 2026 12:27:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
Message-ID: <20261127122710.GE861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
 <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06beb206-886b-4a40-a406-3d877443f5c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_042714_161316_4BF3383D 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon, Nov 09, 2026 at 04:51:43PM +0000, James Clark wrote:

[...]

> > > TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> > > it in trbe_enable_hw() postpones cleanup until another run starts. If
> > > AUX output cannot restart, for example when AUX space is exhausted,
> > > that clear never executes. Clear the status in arm_trbe_disable()
> > > after disabling TRBE instead.

> > Why is leaving it set a problem though? That's not mentioned. Maybe
> > there is some later patch that requires it?

> I see Anshuman left a similar comment on V1 and you said there was a race
> condition. But that explanation wasn't added to the commit message, and I'm
> not sure if it exists anyway. A late IRQ after already disabling the buffer
> would just hit the check for a NULL aux handle and not run the handler.

Yes, with patch 05, the handler returns before accessing sink data if
the handle is NULL or the AUX transaction has ended. That early return
leaves TRBSR_EL1.IRQ untouched.

Status register is not only about status. It can assert IRQ singal
until software clears bits. Clearing it in arm_trbe_disable() deasserts
IRQ signal so we don't need to worry any pending interrupt even after
the TRBE buffer has been disabled.

The reported issue [1] seems a good example for why we need to do this
way. I will amend the rationale in commit log for new version.

[1] https://lore.kernel.org/linux-arm-kernel/CAPhsuW665wcpXxE8pfzRMfdxZwh9ogGsvd1aEBFREq61cz4Y5w@mail.gmail.com/

