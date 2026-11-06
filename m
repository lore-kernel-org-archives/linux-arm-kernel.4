Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C0606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGqkQ0h+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QOFmY3f5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ner4HLqt8P3aTA3rkqClyXoS9WPb6d7Nw2R94iR6ruY=; b=XGqkQ0h+lz1+zQ
	Nca9ioZH7emzENF243A2fJTem7KLDozHTrZlCMp5NEX+INNjEAiF+Z27aAyfCW2fsRq8qg0zuIN6B
	eo2+2VtxikS6bHYhYDZRVSRr4mJx2ugge9LK8E6Ojy/wYum6DBQIv8Ej1bH13XgGczA/jSaptX5eQ
	re9m4BE8qEk/mQI7KmMFvugyCt5ifCp/d9eWYI9sTB4uayh6yF5g+f3h/B9qzUeq5hLCE14TLFISB
	hMVP6gctPYSE59S4pg0p5AGJgDOGKFzQ7UjWthuvuYtaPg6gvtechEKjq/vPmrkXz4Yv8xc92UlGr
	5zHAgRTrbmzaU4jdztyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOo5-0000000DPi2-26AO;
	Fri, 06 Nov 2026 18:36:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOnz-0000000DPfq-32R9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:36:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 295011650;
	Fri,  6 Nov 2026 10:36:48 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B012E3F673;
	Fri,  6 Nov 2026 10:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990211; bh=7ULSo94m9nkPCuWX576aB6lAnEnwhX48KblE/3XT8yc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QOFmY3f5TtXhb8oHDOllkyppL0ZWSK8FQJ5UPVoOGmLZT6wg6KGDCti0XGnB7OGhr
	 vaCZwTu7osM0MxpqMr9WYrSj8G6tLadtcfCdpDhKhuRKMn+Z+OpZ+EbIDnaAZWxURB
	 y7QbR9/kugsJ7MWHeRLU1fJ6X5tdu+Q/VvNbbjTg=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	sourabhjain@linux.ibm.com,
	coiby.xu@gmail.com,
	bgwin@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v8] arm64: kexec_file: Fix elf_headers memory leak in retry loop
Date: Fri,  6 Nov 2026 18:36:43 +0000
Message-ID: <179399019202.2520879.12342583488895085376.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105125724.2283453-1-ruanjinjie@huawei.com>
References: <20261105125724.2283453-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_103651_805792_9890C2DD 
X-CRM114-Status: UNSURE (   5.42  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 20:57:24 +0800, Jinjie Ruan wrote:
> A retry allocates new elf headers and overwrites image->elf_headers,
> leaking the previous buffer.
> 
> Free it before assigning.

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kexec_file: Fix elf_headers memory leak in retry loop
      https://git.kernel.org/arm64/c/ac302aea3d82

