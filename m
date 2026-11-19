Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5AD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RXnwfI8V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giT8vF9X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+mOeVpvRBA6/46O5gUxxVFZ88WfFegk/q5O3KpOSYyQ=; b=RXnwfI8V/UX2oi
	WWPggqcyscPpDOfY+zCM9+56uJIgWsoCM1I+jM/ASQ+Dh2dJZomHLzV21YP070kSfZVD2dMkvBUvZ
	rR3QvTSoK/Hhsm/X/MygN/N2JKnE3sj5RufMGBfVn0NFgWhxtBYqTu8FQqtSWQVGzPLG1doEO8N7n
	j3TJRBtvBQPrENxHB/sz/vtwczLOHRUXuEOTtUYMPrj9h9Oad+5imbzNDXuY9IPHvt64fWlIaqRnS
	9JpH6g95vIIVLndc+cKOnoYgJZbprQMv3tH3KjPbIGuJ74+8MUA9Wyj6uhRRaHt7RmmfQm39TeA/P
	F+8CiEBAFLUiqbhRza3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UQ-0000000BtmG-26oa;
	Thu, 19 Nov 2026 12:43:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UP-0000000Btkg-2XHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 122EF61815;
	Thu, 19 Nov 2026 12:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94B81F000CA;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092224;
	bh=+mOeVpvRBA6/46O5gUxxVFZ88WfFegk/q5O3KpOSYyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=giT8vF9XIYLphfHxRXn7q26XJPZrcugkYGL4j+Bu56ZY/1BNC2KmVWHJYd+wwuHNt
	 GusMXDh2FpoCgxyPzKaDshBUwzqOjG+o9BubKwSs19mmii0pV5sAdZaEieIvrAeHuS
	 RxHqjB3bYocYlXxURioNZSLrKHIWdPF+tg3HE/S3ir5GKs09JZDCESWd8LUJp8jdEA
	 EI5Rh7JFPdB1kGePFKY5e6B6Y5FCkTAFn1TQv4FkJ5bqqtgya/uhGKWmtsl3EzlSXd
	 5aAFLpM6emUl2+kY7uhxg/GzMEQPXXtWTMi1pZpNxJDMZtcaLbRXtq1ikV/7sRZQ0p
	 vZbEFgIwR3qVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1UN-00000000RvW-008r;
	Thu, 19 Nov 2026 12:43:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: Congkai Tan <congkai@amazon.com>,
	Dan Carpenter <dan@pereq.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Haris Okanovic <harisokn@amazon.com>,
	Joey Gouly <joey.gouly@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Stanislav Spassov <stanspas@amazon.de>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Blaudeau?= <clement@cryspen.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: nv: Fix a couple NULL dereferences in kvm_inject_nested()
Date: Thu, 19 Nov 2026 12:43:33 +0000
Message-ID: <179509215916.3938200.9104280660792618506.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795006659.git.dan@pereq.eu>
References: <cover.1795006659.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: congkai@amazon.com, dan@pereq.eu, catalin.marinas@arm.com, fuad.tabba@linux.dev, harisokn@amazon.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, oupton@kernel.org, stanspas@amazon.de, seiden@linux.ibm.com, suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com, karthik@pereq.eu, clement@cryspen.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 16:05:38 +0300, Dan Carpenter wrote:
> This is part of our formal verification work at Pereq.  It's a couple
> of NULL dereference bugs that affect nested virt.
> 
> The first version added checks for if the vcpu was loaded but the
> new version loads it unconditionally instead.  Also add a fix for
> the related bug that Sashiko found.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Load the vcpu in KVM_SET_VCPU_EVENTS
      commit: 5651590be08a6dc7e36cbef415c8f23af1cda4d9
[2/2] KVM: arm64: nv: Fix NULL dereference in kvm_pmu_nested_transition()
      commit: 09edd2a7ed8a1aaae8e472ab11313faab9f401cc

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



