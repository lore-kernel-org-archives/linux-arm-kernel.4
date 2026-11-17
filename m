Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4D6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awioLUT7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P21UoPiJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fm0JOqfmumXNaYfIcKsaZgcOXsOJwEEHVEF9rB5LLwc=; b=awioLUT7cfQpzy
	DdsE3+KEI4gOf9TNhRyx4EsRhbftfddenx6JdmuY8FMcIgk/+fvlF+SGNaD02v5HbxFcobA7BBO1z
	Uwjoe7bKKbCm3VX/B9IHNQPzepDOH4s6cgWUfm9Wo1zbmt4Y6+0cIvH9Do687m9T9JRPiJP1agQuh
	rjaRTx+INBNsQl7K7Z3Il+g3O3qKAZOo7pQkAFI2YrMo/LTu8uOYJCsqe5zV5X7tjsYB7grA6B8Jt
	wsSoeT+laTl/8SYXN8pZf38VLxPZizCl7mxr1WB0t7jO54aWK6DolkcTUi5RJLNqaxerPm8Y9Q4+Z
	nehcdoncLr1fAXEDorBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBD-00000007B73-1OXq;
	Tue, 17 Nov 2026 21:57:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBC-00000007B6l-0eOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:57:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E4E8403B8;
	Tue, 17 Nov 2026 21:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4BF1F000C8;
	Tue, 17 Nov 2026 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952649;
	bh=fm0JOqfmumXNaYfIcKsaZgcOXsOJwEEHVEF9rB5LLwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P21UoPiJcGdKOtXwqso+eLvWIqZkUziwRvE050c36SS317OVJyHDRl06NhHExC9r/
	 s+6GnSwBZoPPETzpIdlKj6pQWz3JVMw9bVhyfpE5q2lsbaPRJgPVigP+8ddTgZ4cAv
	 qUE/2j6NliS9MP8nSCn4pAO9UAMcnKzRRevzNZjPOPuQWvyGYWH7vvBtrkAJllJ0gY
	 tGRTX8x0gDqyYYKwQf7qKbZZZqU3kjus5dd3L1cN3MtOv2h2bttb1muY6us4cQZg1v
	 N0wxDPxgwwwO+3wXStJKfqTOFwXX4Ymawsl/8U9N63xMQNmMYTKDXHXHf6VOiEwfZC
	 6mgH4xARN7vkQ==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: Add KVM support for newer Apple Silicon CPUs
Date: Tue, 17 Nov 2026 13:57:24 -0800
Message-ID: <179495264127.1456871.1866504028661732526.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
References: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026 10:53:19 +1100, Michael Reeves wrote:
> This series enables KVM support on Apple Silicon M3 (base, Pro and Max),
> base M4, A18 Pro and M5 Pro CPUs.
> 
> The first patch adds the CPU part numbers and MIDR definitions.
> 
> The second patch adds these CPUs to the existing Apple Silicon PMU and
> broken SEIS workarounds. It also enables TDIR detection so KVM can trap
> guest DIR accesses without trapping all common registers.
> 
> [...]

Applied to next, thanks!

[1/2] arm64: Add CPU part numbers for newer Apple Silicon CPUs
      https://git.kernel.org/kvmarm/kvmarm/c/61615311ce39
[2/2] arm64: Apply existing Apple Silicon CPU workarounds to newer CPUs
      https://git.kernel.org/kvmarm/kvmarm/c/3a7b70524c54

--
Best,
Oliver

