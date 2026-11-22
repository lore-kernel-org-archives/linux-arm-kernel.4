Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E0606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+rqDerK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFeQzdky
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uSoTt+TxpepghCj1j5m2W66DMLP6FbjOrMJ/a3Zmg+E=; b=M+rqDerKvXUrSVCOmj4+V/X/tu
	XZkQoaENj5Kq8AdhLD4XjTbxwf+zTAHPoplQINih7laUAQChy/nBKeFi0v/+zFsD62Ua7Dv7vkFRU
	1+0d1rXNefpolf4IrK+2/2sAgnPE2gW/ujv768RS/asrfdHLo+fjfwcqacmOyvan77GvazQEApfbj
	G48kNvzW83XU5Z/RYkWm+DeuIbFOc9we51K0kJbe30VqKxEhS2Nw9j6Lt1duMrDyta8Bk6vwmHXBM
	cmQI+6wDQToE7GK6Nk6iVDa2okWrMG7lK7EcvcQ8rBYmo/QMUtvk2yjmXetP8qjrITNsvd3Tffvck
	rLFJwjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD3Y-00000001c5o-1Hlr;
	Sun, 22 Nov 2026 19:16:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD3X-00000001c5g-318U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EB4642E1B;
	Sun, 22 Nov 2026 19:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7DB1F000C6;
	Sun, 22 Nov 2026 19:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375014;
	bh=uSoTt+TxpepghCj1j5m2W66DMLP6FbjOrMJ/a3Zmg+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFeQzdkyIDBbad15Fyeby3tqqxBufjvttYjpWQGh7H4AL9MU1Eo+zuoDPuD5L43WC
	 7HrKta1V831kK1+REbSUvGZxVxnoMFleoij6NrH25cJvoRvein+aChotT/UP0rZHDe
	 UbN+44Z+NlhLDbeSaD3f/EYB6DEu2TQ8IZAhMCLfItx+sz17xkh3Rak5L0PdoT0lRQ
	 xjgE66AWNs5+2mkldFMWuEGjJTkI/uDNr8ss0WbNvyLciXUOu+ZjgQ52jYL0MxVlnx
	 Pa7BdUjzHeNdoa6O1rYfVF8vL+hwBCMAThWYKgQp9+IP8OLwMRWIwYaNm94rEiR+eY
	 p5QYdUeqgSyZA==
Date: Sun, 22 Nov 2026 19:16:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Divin Raj <divin.raj@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
Message-ID: <20261122-memorable-electric-sawfish-ac9f11@sudeepholla>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
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

On Thu, Nov 19, 2026 at 03:36:02PM +0000, Ahmed Azeem wrote:
> Hi all,
> 
> This series proposes an arm64 driver for the Arm Platform Fault
> Detection
> Interface (PFDI), providing a common Linux interface for privileged
> userspace to discover and invoke firmware diagnostics.
>

I reviewed the PFDI (Platform Fault Detection Interface) specification
and found some issues that needs to be addressed. In general, this spec
is not on par with other Arm SMCCC based firmware interface specifications.
Many of these issues should have been identified as part of reviews before
the beta release and should also been raised by the team that prototyped
or wrote this driver. I threw my review comments at AI and got them
refactored as below. Hope it helps.

1. State Preservation & Calling Conventions
 - Make state preservation a conformance rule:
   Move the expectation that firmware saves and restores modified state
   from descriptive usage text ($4.6.1) into a formal requirement ($4.6.3)
   and cover it in compliance tests ($5.6).
 - In general the specification has mixed the terms platform and PE a lot.
   It needs to define "system state" and failure behavior:
   Specify exact architectural state (e.g., registers, SIMD/FP, SVE, SME)
   covered by restoration, how it interacts/matches with SMCCC and PSCI
   powerdown rules, and what happens when a test fails, encounters an
   internal error, or triggers a system-level fault reaction.
 - Clarify calling conventions: Use "SMC/HVC" where both conduits apply
   ($3.2), and explicitly mandate preserving x5–x17 within PFDI rather than
   relying on unpinned SMCCC baseline versions. In one section HVC is allowed
   while $3.2 just mentions SMC.

2. Virtualisation, Isolation & PE Scope

- Tighten error-injection isolation:
  Because PFDI_FORCE_ERROR leaves an error pending on a PE regardless
  of software context, require hypervisors to prevent cross-VM or
  cross-OS consumption during context switches or vCPU migration.
  I don't fully understand that interface TBH.
- Clarify guest PE identity: Reconcile the requirement for hypervisors
  to forward an "originating PE ID" unmodified with the fact that PFDI
  functions accept no PE ID parameter or clarify the requirement clearly.
- Define PE vs. system scope per function: Clarify whether "PE" means
  the executing CPU or a tested non-CPU resource, explain how drivers
  target remote CPUs without a target-PE argument(assuming it needs to
  run on that PE, and specify whether PFDI_FW_CHECK is PE-local or
  platform-wide. In general, the term platform and PE are mixed in the
  document which makes it hard to understand where the rules apply.

3. Function IDs, Execution Timing & Indexing

- Correct SMCCC Function ID classification: Reclassify 0xC400_02D0 –
  0xC400_02D7 from "vendor-defined" to the Standard Secure Service range
  and confirm the assigned subrange. It was very confusing to read the
  reference to vendor defined range.
- Bound CPU occupancy time: Because PFDI uses synchronous SMCCC Fast
  Calls without a timeout, cancellation mechanism, or runtime duration
  query, define a maximum execution duration, permitted call contexts,
  or a yielding/asynchronous mechanism so OS drivers (like Linux) can
  be aware of CPU time doing this test.
 - Resolve test-part indexing and zero-count conflicts: Fix the off-by-one
   discrepancy (0..test_count vs. test_count - 1), correct the
   PFDI_PE_TEST_RESULT faulting index format (= 0 vs. general index),
   and define behavior when test_count is zero (PFDI_RET_TEST_COUNT_ZERO
   is currently unused).

4. Error Injection Semantics, Compliance & Editorial Fixes

- Align reset rules and restrict injected values: Add an explicit exception
  allowing resets or firmware updates to clear pending injected errors
  ($3.5 vs. $4.9), and restrict PFDI_FORCE_ERROR (x2) from accepting
  zero or positive values alongside defining deployment/authorization
  policies.
- Resolve optionality contradictions: Clarify whether individual PEs
  can implement a subset of PFDI functions ($3.4) or must implement
  all mandatory functions ($5.1).
- Missing"Security and Safety Considerations" chapter referenced in $1.5

> We are posting this series as an RFC to seek community feedback on both
> the proposed Linux interface and the underlying firmware specification
> before the specification is finalized. This series and its validation
> use

Specification needs more work IMO, so please get them addressed first.

-- 
Regards,
Sudeep

