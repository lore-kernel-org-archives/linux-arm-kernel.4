Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E9606D808
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OJ+fD1j3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rDSi/ksB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4M2Ug6+sc3RFSzmdaYcK0tVL/sc44GoFVdqmCKfk9+E=; b=OJ+fD1j3aD4p5l
	lT4Lq/JwTatx6vdPkdWWhso8kVFbEcGv/NTWbTz5kUc5dK5MUgIlXTDGncOutqHs24zITFGZhw+tB
	XIgKUucSzgFDdhvPcouhpvQmeDFjpdZtEfmENboT2fFnP3DzU8sH0IUbaIKg74pfZNHsFXM6i3BSO
	I8qDAt3WLVzsT7E60AeVteFAOK/4gh4tqi/f9gxhowyInTjWFNdk4ZRTwWnbWKm+gsb9KQm9kOitC
	LBD3qrk7TdIlEzMrEedJZdLo8M3MPzcI5cTwkUI9v3/5KhcAYv1DsOiBgSSjRaYg57nuurqPoL3/T
	ukC1wOgYl+JgN0hVlT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOch-00000000iIC-3667;
	Mon, 09 Nov 2026 12:37:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOce-00000000iHK-2wo2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:37:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E34681576;
	Mon,  9 Nov 2026 04:37:12 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 143713F632;
	Mon,  9 Nov 2026 04:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227835; bh=bbU8vjk3/U/uslDQYyD+xxGnVcFZAPPAtmds4JD+P4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDSi/ksBFxCLASk9AcTB0iEcKrNeruGI3aeDjEnni3Ll2nyX78bS/2RQUsOeLiogC
	 6noVyfuAVurAtfJkSiWzuTr/kuvNwafUx09qib8u4b/a/bB3NU/fJy4Gr79EEGdZBd
	 zd34niL1ZGlio//dyJ34QCEDhf3hjFI6ISrNJReQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Mon,  9 Nov 2026 12:37:11 +0000
Message-ID: <avG-dw9Pa_94CxA6@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1639d961-1092-4a47-8825-55c1647a115b@arm.com>
References: <20261106161240.1345126-1-leo.bras@arm.com> <20261106161240.1345126-2-leo.bras@arm.com> <1639d961-1092-4a47-8825-55c1647a115b@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_043716_784251_1FDA239E 
X-CRM114-Status: GOOD (  13.40  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:59:05PM +0000, Suzuki K Poulose wrote:
> On 06/11/2026 16:12, Leonardo Bras wrote:
> > __kvm_pgtable_visit() performs a bunch of calls to
> > kvm_pgtable_walk_continue() to find out whether the walk can continue
> > further, and if not, 'goto out', which retests the possibility of
> > continuing the walk before exiting.
> > 
> > Given that it's testing the same ret variable again, there is no reason
> > the result of kvm_pgtable_walk_continue() would have changed since the
> > previous check. So turn this goto into an early return, simplifying the
> > code and paving the way for further rework."
> 
> Looks sensible to me.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 


Thanks Suzuki!
Leo

