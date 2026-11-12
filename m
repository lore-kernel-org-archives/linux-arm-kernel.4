Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1524606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VEPcLAum;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tDi7v/dp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7v68YZ5OR9YnCTmdJ/878LbBsOgRuy7SsL0cUuqtrJw=; b=VEPcLAumthVBECUdJFGdRrL6+n
	SVj0se4IMkv/UzsMUz1l85T2wwtqRNnYbgk3OMb9EplJytuYA72OSNxzJnSfhkGER5OOyB7K5/vMJ
	f9mJnQH+3X1SNrfmYil/VgDGQ3kqHisTbbPczrKKVzZVDnw+o/fzTrkRbZ4CgD+pUH5FJKxzXoSFz
	u3CwHsLmst+w+4gVF04oQXbv+JpN/joYlRmYUpHXWCBqKvgT9eF2DVFU0IjFzbu77Q8NRjKoHyrbw
	z0R90anv8mgze20C+4L+RpSU6Sos8g+ik1H+vUxYgqet9z8yOf/dbi4FGPlE7mkEX5FnF332tNGZ/
	FAe4/15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXQa-0000000AYgX-3h4Q;
	Thu, 12 Nov 2026 16:13:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXQV-0000000AYfY-2nAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 981501516;
	Thu, 12 Nov 2026 08:13:23 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B32A3F673;
	Thu, 12 Nov 2026 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794500006; bh=ypcXC4yZuFXp31/sANCT8ECJG0IUu2kVuWxgJOc2Qko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDi7v/dpggh82dTCsclxMKT8WK2iJzpaE5YQvlleUIgkyLbucObj5dDU+MTipbEi/
	 iX7YexJdYCv2JNE8PISfAhXmue+W+lz43Bq3BKfGYpKSHuUAatImOfBaeoIQadPugC
	 wBAcVl9DYCmJtnvp1x6Kbbgztipo9zTExuTvLz5k=
Date: Thu, 12 Nov 2026 16:13:21 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 06/28] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Message-ID: <avXloVVaBeEwEplU@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-7-alexandru.elisei@arm.com>
 <atDtheEuNRs7v3Gx@gremlin>
 <avXcdwY89YPFGIlk@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avXcdwY89YPFGIlk@raptor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_081327_758247_3184D21C 
X-CRM114-Status: GOOD (  14.57  )
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

Hi Lorenzo,

On Thu, Nov 12, 2026 at 03:34:15PM +0000, Alexandru Elisei wrote:
> Hi Lorenzo,
> 
> On Thu, Oct 15, 2026 at 05:51:03PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 03, 2026 at 05:06:01PM +0100, Alexandru Elisei wrote:
> > > [..]
> > > +	if (!entry)
> > > +		return;
> > 
> > Hmm, shouldn't failing to allocate here be an error, or at least a warning?
> 
> I don't think it's something that should cause the probe to fail. I could
> add a warning, I guess, to let the user know why KVM_CAP_ARM_SPE is missing
> even though the SPE module was loaded successfully.

On second thought, there's really no need to taint the kernel if the
allocation fails, KVM and the SPE driver can still function correctly.
Since the likelyhood of it happening is very low (it's a small allocation,
only three pointers), and userspace can detect it happening because
KVM_CAP_ARM_SPE is not available, I am inclined to keep it as it is and not
print a warning.

Thanks,
Alex

