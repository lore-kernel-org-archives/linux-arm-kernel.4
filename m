Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JxqjgOM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=K1/kCLR0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1IOWT/d14QlycRCg1JO/Jw8AIofZ/OvIL8rsv66jEYY=; b=1JxqjgOMVnbn5B8WqBr1jZ0aTp
	6zoXtGy7Mttm7SBK1XRm91RUXzQ+CRfjAnR/RVTQ4IvyaQQYSusJSATU2ooAURC1NyS1B1wdid9xP
	APpUGUyqoxlTlXvHTXgQV35k75HWR1QX23ACp/5deoXY+8hz5QSV76PMdT02iWB2V7GNrmsURgl8v
	sF0mF3ZqJpDHzRIaByFMdVDiagEhSaVAiK2cp/NgTdZRBVxeo11kCK5mnsjUbe1N+jyFP158+8jxB
	vgPonnQ+lVnMNvhdo0x6QsLhaygEBgfnR0C9cqSn4h6b5TXVrSiJnxXTtHjWWL/pSgCSqBsOqBYHq
	0aemuptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXPP-0000000CpTA-0qxM;
	Thu, 26 Nov 2026 11:12:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXPM-0000000CpSq-1j4x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:12:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E821BA8;
	Thu, 26 Nov 2026 03:12:52 -0800 (PST)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799183F632;
	Thu, 26 Nov 2026 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795691575; bh=hEzuUTn3NIQ9D3Y7opBppSoWZoPbrfaVx4Stp1mWYZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1/kCLR0+zsGKueO4tdlfcGvC9uI1tsDD16FNl70XtlY2s4dLuG8uxI8AV8mSTvpW
	 CYpB7JHabMm7QHU4onorSCZylhv92pJXFgeQ4CsC8UURe2rU824wndSsxeMuszHm8d
	 Ny0uSTvsItVYs3DLx4g3j6wwY6T871PnF9x+Rqvc=
Date: Thu, 26 Nov 2026 11:12:46 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 02/23] KVM: arm64: Extract number of sys_reg_desc into
 a constant
Message-ID: <awgULp1w79g4HvA4@e143914.arm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-2-75e95980fb10@linux.ibm.com>
 <awbw3NyDifa0WjhZ@e143914.arm.com>
 <20261125153027.117976-A-seiden@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125153027.117976-A-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_031256_635327_22E843A7 
X-CRM114-Status: GOOD (  24.82  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 04:30:27PM +0100, Steffen Eiden wrote:
> On Wed, Nov 25, 2026 at 02:29:48PM +0000, Joey Gouly wrote:
> > On Fri, Nov 06, 2026 at 05:07:35PM +0100, Steffen Eiden wrote:
> > > Define the constant `num_sys_reg_descs` which stores the number of
> > > elements in the sys_reg_descs array. Replace all occurrences of
> > > ARRAY_SIZE(sys_reg_descs) with the new constant.
> > > 
> > > This refactoring eases the integration of handling system registers for
> > > arm on s390. s390 needs code from the shared code to define the
> > > sys_reg_descs. But also the shared code needs the definition of the
> > > sys_reg_array and we cannot forward declare arrays and use their size
> > > before it is properly defined. This patch solves this chicken or egg
> > > problem. For the time being s390 cannot process the full arm64 defined
> > > sys_reg_descs array.
> > > 
> > > No functional changes.
> > > 
> > > Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
> > > Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> > > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > 
> > I see later in the series, the include of sys_regs.c into s390 is done
> > before the s390 sys_reg_descs array is defined.
> >
> 
> Are you referring to [PATCH v3 08/23] KVM: arm64: Share system register code with s390 

I was talking about arch/s390/kvm/arm64/sys_regs.c in
[PATCH v3 16/23] KVM: s390: arm64: Implement arm sysreg managing infrastructure.

+static const size_t num_sys_reg_descs;
..
+#include "generated/sys_regs.inc"
..
+static const size_t num_sys_reg_descs = ARRAY_SIZE(sys_reg_descs);

> 
> There, the sharing is done from the arm64 side.
> 
> As this is a new file for s390 the sharing only gets effective with
> [PATCH v3 16/23] KVM: s390: arm64: Implement arm sysreg managing infrastructure
> 
> There, in arch/s390/kvm/arm64/Makefile.gen I add the sys_reg.c as shared
> file. Before it will not be processed (nor included) by s390.
> 
> And there in our sys_regs.c I'll define that array.
> 
> Or did I miss something?

Sorry, I wasn't saying anything was wrong, just reading the code and
writing why it makes sense to make this change!

Thanks,
Joey

> 
> > Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> > 
> > Thanks,
> > Joey
> >
> 
> Thank you!
> 
> 	Steffen
> 

