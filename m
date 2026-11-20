Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F027606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrXesuej;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=BUOB4sR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JswpRUgs5UDlZob8ca9OhYXkbPtKRKpD9M0ivfXIf2w=; b=GrXesuejhjx61LPXLI7yT5RAH0
	UaXeQLBrZywIPy+L3lVTqdq5AT0FBOCZedswG85Og0v6OlDry1KGWBF9dl2iuJ77GkGxyPplhQ93O
	sf+B+CD3aOOxFscyfCTFky87iJMrvl+ci3ldaMiaQThPZWQd9Z3tNkMgEFOnRepghJb3kaA5ZuWam
	pKVysQZfhgK233z5vfw7uaNPJnaM83ecSGavIa/Gpp+1JTFPTMQbxUUE8lvMqQqFAIVoCP3rmrsV7
	gi1uGUxYvAcObkvFYudyooO3aowRT1LlkkIoAVmX7OScXi8tDSVCH0Aw0HSu75sSJJzFUdpFGnlHz
	4lijaS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHFF-0000000E4z9-2wcJ;
	Fri, 20 Nov 2026 05:33:09 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHFC-0000000E4yG-2Ty1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:33:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so4770575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 21:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795152785; x=1795757585; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JswpRUgs5UDlZob8ca9OhYXkbPtKRKpD9M0ivfXIf2w=;
        b=BUOB4sR3hAIltXT9CTa2JMjo6ch1K3ks//j7OmxPtspSWtUodTmzm0S9j6z2CyHf2f
         OVXt7H59iR+gGVHkbIj9p1JEcfdeFINc/bjephamKVM09Ln/wdshCGqxwW+Gi93joBkQ
         tffvyiaQaNp5Yl+e856U4DbJHdI58XM7Zp7V3CX2KpYqnilfWF73RfNHtbfUlBLnO9Ue
         OCUnKMenvzpSPt7DGcHdufDpApU8sDjx2QXISFGRSNYeqotuP8LFhKRnxq0phbU8CVtH
         6x7mmkuSeefmWwF3ZwmUxYDqx163uwYxeqa8olzHKjXKMBmWCH7GicDl/wpb8ocCBj/Z
         S8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795152785; x=1795757585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JswpRUgs5UDlZob8ca9OhYXkbPtKRKpD9M0ivfXIf2w=;
        b=J8b0DaVPlllHMc/r+y8h5drEz8rfvMDE/IiZCnlH5KPn91pBh6qHgNr3SjwhzNkQyt
         nJjIaCdwsJKEoOuo7R6lTxBcOxdP+M0wTgXV+BYS9MKzcEynoD1GN1ludi7qheZs+FIx
         tw/WrTCUawLV5frKj5VD2OR43hoJ1v5SDlSFBIg8pl7yU71zHd+qDg03W/uFn3UwBnjK
         l5PvMoWrR8MPNE8HSeufRZLpjJuV3BxPfxWyqgru9KBp6QuKODHcJO7oFWCyT/K968rB
         o0HYUlg+zR9Dw+dMNqXSe1rNF6601ShcWGai08MNVBquPzEfEMFAhlkL9Grg3WyxT5Zd
         u7NQ==
X-Forwarded-Encrypted: i=1; AL+hErF6Ty1pgYtFXVvczK4QvnI+oFpyig0AtvQMLQPadyAccZQZAD7EuNHOUgpFtCN1d+3GZ9DRl39sQYBBV3KZQt/+@lists.infradead.org
X-Gm-Message-State: APuU4Z8zBeiUdRVKQTvuIxJoZbVifOiTW+5qGMGOcgXxLzKrnf9prkit
	jyJlBYpXumYcOXhduhnzf/+mdWwjPN3LwwhD4CobG39Fe2JYmWLb8zw5S3N3Bsiw3jM=
X-Gm-Gg: AYBFou2w9AYTG1HGiNqC4xwCfWhEBOBzOxJNjd1fRkJpnIbpkCEIKAX7pm7QY1aV9VO
	gi+GJj12K1WkZQaLJwyXjMiyXqoV/E7PmtS6zK+HG3Oc0Pn8y4GHKIC4e4GCTPJed8X8MPvRUvj
	xNA9AEbt5ru/bZ3J2Vz6vMNsMl50/AXzpSRFl0B6oVCjhQtgg6o4CnZvll1ihBcYTlTJu0RGyIo
	sb+zq/SN3e2Xxq1u4c0Ve86wqz92E8TmWGppuyK02nK37xUZKZDxKRYbeMxmL87HifXUZ2qK48H
	c2hzT67vg4LkL7ejytZrwRs3kVaymomxN6HHlVrjmidKOqZMPJuUunbhTWz1KwX60L6SaC38uKD
	bWRrUVoRWYQrHplitsK7NIgU/Hc/M7dlB7nNEQEjhn7KkF3kff53hBnEINd1/Iw4kJh7aUgwWHZ
	m2APSi1A64A2EQmu8Srl0tGyq3ktXCQhNX8rYBBzi01mekU8I3nIacH5WcfOCD89RD39wwveWFc
	lZG4LkJ0rltCnLD5eE+URVhACuo/5EodcQ+1sA3GYPgpNOe19lsBH59WpYuUoADF+gEQtstreAD
	BYkbFMEW29alMApnCNA=
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr42560215e9.31.1795152784546;
        Thu, 19 Nov 2026 21:33:04 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm48629875e9.1.2026.11.19.21.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:33:03 -0800 (PST)
Date: Fri, 20 Nov 2026 08:33:00 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] KVM: arm64: Trap TCR2_EL1 writes when S1PIE or
 S1POE is hidden
Message-ID: <av_bjCyoM93HColG@stanley.mountain>
References: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
 <20261119-nv-tcr2-v2-2-3deb1a6cdba8@pereq.eu>
 <86wlq8zssf.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fvYP6yF1qK5VM2os"
Content-Disposition: inline
In-Reply-To: <86wlq8zssf.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_213306_805132_BA87DBF6 
X-CRM114-Status: GOOD (  37.61  )
X-Spam-Score: -1.8 (-)
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

--fvYP6yF1qK5VM2os
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2026 at 04:32:00PM +0000, Marc Zyngier wrote:
> On Thu, 19 Nov 2026 13:25:35 +0000,
> Dan Carpenter <dan@pereq.eu> wrote:
> > 
> > A VMM can offer FEAT_TCR2 to a guest but hide FEAT_S1PIE or FEAT_S1POE,
> > for example this is done to keep the VM migratable.  KVM then stops
> > loading the PIR_EL1, PIRE0_EL1 and POR_EL1 registers for that guest.  But
> > the guest's writes to the TCR2_EL1 register don't trap, and the CPU still
> > acts on its PIE, POE and E0POE bits.
> > 
> > If a guest turned these features on, it would run with the permission
> > settings another VM left on the CPU.  Technically this is a kind of
> > information leak and a guest could figure out another guests permission
> > setting based on which accesses fault.
> > 
> > For these VMs, set the TCR_EL1 bit in HFGWTR_EL2 so that writes to
> > TCR_EL1 and TCR2_EL1 trap, and clear the hidden bits in a new
> > access_tcr2_el1() handler.
> > 
> > Fixes: 58627b722ee2 ("KVM: arm64: Make PIR{,E0}_EL1 UNDEF if S1PIE is not advertised to the guest")
> > Fixes: b86c9bea6349 ("KVM: arm64: Save/restore POE registers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan@pereq.eu>
> > ---
> > v2: This is a new patch
> > 
> > This is only a partial fix, I will update nested virtualization in the
> > next patch and the !vcpu_has_nv(vcpu) condition in __compute_hfgwtr() will
> > go away.
> 
> No, I really don't want to go down that road.
> 

Yeah.  Thanks, Marc.

I'm still a KVM newbie.  I'm embarrassed I sent that in retrospect.  I
had Claude create a checklist based on analysing your review comments so
I can hopefully get ahead of it a bit.  Attached for your amusement.
Apparently 10% of the time your review is "Why?"

Also Claude says that it could have found the Sashiko bugs by reviewing
patches to see if any different bugs get exposed by making a fix.  We
shall see.

Btw, I'm still hoping to get you that selftest but I need to send a few
more fixes first.

regards,
dan carpenter


--fvYP6yF1qK5VM2os
Content-Type: text/markdown; charset=us-ascii
Content-Disposition: attachment; filename=marc-review-checklist.md

# Predicting Marc Zyngier's review comments (KVM/arm64)

From 1000 of Marc's review emails (`~/progs/kernel/tmp/maz_reviews/sample/`), read in four parts, plus his
replies to our own patches in November 2026.  The counts are emails per 1000 (rough).  The checklist is the
part to use; the rest explains it.

## Pre-send checklist

**Rationale and correctness**
- [ ] The commit message says *why*, with the concrete sequence of events that goes wrong.  "Why?" / "What
      is the rationale?" is his most common question (~100).
- [ ] The behaviour matches the ARM ARM (or the GIC/PSCI spec), using its terms: UNDEF, RES0, CONSTRAINED
      UNPREDICTABLE.  Cite the section if it isn't obvious.  Not "what QEMU does" or "what x86 does" (~95).
- [ ] The root cause is fixed rather than papered over.  A WARN stays until the bug behind it is fixed.

**Cost**
- [ ] Nothing new runs on every entry or exit, and nothing new traps, unless it has to.  Prefer
      vcpu_load()/vcpu_put() or a static key.  Don't make VMs without the feature pay for it.  Under nested
      virtualization, ID-register reads and EL2 accesses trap, so count them.  Any performance claim needs
      numbers from an exit-heavy workload such as hackbench (~55).
      *Ours:* trapping TCR_EL1 to fix TCR2 got "an absolute performance sink"; the `loaded` checks in
      kvm_inject_nested() got "fast-path bloating".

**Minimal fixes**
- [ ] The smallest backportable change: no rework, no churn (renames, reordering, moving files,
      guard() conversions), no speculative fields or hooks, no Kconfig options ("battery included") (~40).
- [ ] Fixes: points at the real culprit, and only at something actually broken.  Cc: stable only if the
      backport is worth having (~30).

**Reuse**
- [ ] Use the existing infrastructure instead of a parallel mechanism: generated sysreg definitions,
      config.c feature maps, FGT/FGU, the trap tables, sanitised registers, vcpu requests, existing helpers.
      No magic numbers or duplicate definitions; use BIT()/GENMASK()/FIELD_PREP() (~55).

**Nested virtualization**
- [ ] Nested virtualization is VHE-only, and nVHE is effectively dead for new features.  Don't add code for
      combinations that can't exist.
- [ ] A new trap register comes with everything it traps: encoding_to_cgt[]/encoding_to_fgt[] entries, FGU,
      RES0/RES1 in kvm_init_nv_sysregs(), and VNCR where it applies.  No half-done features.
- [ ] Keep nested-only hacks local, so that someone who doesn't think about nested virtualization can't undo
      them by accident.

**Userspace ABI**
- [ ] Assume any VMM, in any order, and saving or restoring at any time; not only QEMU.  No KVM-internal state
      in the UAPI, and no new capabilities for KVM's own problems.  Tracepoints and stats are ABI.  Choose the
      errno with care.  Ask whether a WARN can be triggered from userspace: it panics under pKVM (~65).

**Locking**
- [ ] For each lock, READ_ONCE() or preempt_disable(), know what it protects against, and what stops the vcpu
      running or the value changing "behind your back" (~45).

**Code style** (~70, mostly "nit:")
- [ ] Clear names (not "Java-esque"); one helper per job, written once, no single-caller one-liners; no
      unneeded inline/__always_inline; no macro abuse.
- [ ] Comments only where the reason isn't obvious; no stale, wrong or obvious ones.
- [ ] Don't break lines just for 80 columns; he ignores checkpatch line length.

**Commit message**
- [ ] Short and technical: not a cover letter, not a recap of earlier versions, not marketing, no "No
      functional change intended" restating what was said.  It matches the code.  The subject says what the
      patch really does, with the right prefix ("KVM: arm64:", "KVM: arm64: nv:") (~40).

**Series and process**
- [ ] One logical change per patch, bisectable, documentation and UAPI in their own patches, the feature
      enabled last, each hunk in the patch that uses it (~45).
- [ ] A cover letter; a "Changes since vN" log for each version; Cc the maintainers and earlier reviewers;
      based on kvmarm/next or -rc1..-rc3, and only fixes after about -rc6; tested, and say how (QEMU as well
      as kvmtool, 64K pages, lockdep, a selftest for anything with a reproducer) (~60).
- [ ] When he replies with a diff ("completely untested", "How about this instead?"), take it.  If he writes a
      comment, paste it in verbatim.

## What makes him blunt

Ignored review comments, missing changelogs, maintainers left off Cc, untested code ("I stopped reading
here"), churn, hand-waving about performance without numbers, "go read the x86 patch", and wrong bot
findings.  He does credit correct bot findings ("Sashiko has spotted an interesting corner case") and
accepted a patch with "Assisted-by: Claude" without comment: what matters is whether the content is right.

## Our own patches, November 2026

| Patch | His comment | Checklist item |
|---|---|---|
| NULL deref v1, `loaded` checks | fast-path bloat; load the vcpu in the ioctl instead | Cost, minimal fixes |
| AT TCR2 v1 | asked for a comment explaining why it works; gave one | Paste his comment verbatim |
| TCR2 trap patches | trapping TCR_EL1 is a performance sink; load 0s instead | Cost |
| mmio_needed (Sashiko) | "multiple ways to commit" the exception state | Root cause, reuse |

--fvYP6yF1qK5VM2os--

