Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E93606D829
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEPptN+G;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JT+SQu3Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6/HJnC54xU4S0Hwp09zNKNs21RBXVSDeqUj8nn08OOw=; b=yEPptN+GQ6qyjev9ksra/l5tAF
	qjxis2YeSsx/6PaesUjfqoXxhLO1AetDVpXsh/zkCXxGTFDxaFaeS6JZmAgC8NKhzMBuIry69+s05
	XIg5HlbmW2tJscmaw0JRvB/1LssxDgiLZuRPTflea+UcK8X5gE3Bg4gBZanffJXBu032eqGYhj2ox
	jnVxkiR2EZvgasubF4XEHybW4qAo3R9pwxRv7YpiEPQBK3q2MgYlDIc0ypbDRZb/7sDq393+lwui1
	McXZKrIvkb7KdeNQBp9bNQMmKgwRqKhxh+NELZEhbLenR2/W7xyVwNox2eOqJp8w3G6H7OYGhJqtA
	tONjBE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOnz-0000000DPfT-1SRN;
	Fri, 06 Nov 2026 18:36:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOnq-0000000DPas-1W11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:36:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 179C91650;
	Fri,  6 Nov 2026 10:36:38 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135CA3F673;
	Fri,  6 Nov 2026 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990201; bh=DJjEZhP5Hy5E4GIWKPZ45otGa4lVGkLO7vzlBu4usdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JT+SQu3YQ1o89rLEfEpFBY/gtK5kQSw5qoBcowIssxFIvLXuWcY/Ey6WtPOSCFI0q
	 yikpABqzrNIWL+XIgFGxcJLqcH36TRP6JcTQviG17Bsfw4iL2tgs9774t/Pj69P9Hd
	 x7F7WYaMjFsHJZ2JoVMv7JPgqQgGlbYBcEUDe4TU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kirill@shutemov.name>
Subject: Re: [PATCH v2 0/2] arm64: sdei: Handle exceptions taken inside the event handler
Date: Fri,  6 Nov 2026 18:36:32 +0000
Message-ID: <179399019204.2520879.14405140378460696016.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105120835.3321912-1-kirill@shutemov.name>
References: <20261105120835.3321912-1-kirill@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_103642_999266_067C4007 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, mrigendrachaubey <mrigendra.chaubey@gmail.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 12:08:32 +0000, Kiryl Shutsemau wrote:
> An SDEI event can land anywhere, and a synchronous exception taken by its
> handler breaks the context it interrupted:
> 
>  - With KPTI, an event that lands in user space runs the handler on the
>    trampoline vectors, whose current-EL half is empty. The exception
>    loops there and the CPU is lost.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: sdei: Run the event handler on the kernel vectors
      https://git.kernel.org/arm64/c/9bf6ee7952c7
[2/2] arm64: sdei: Preserve the interrupted context's exception registers
      https://git.kernel.org/arm64/c/58c1eb84e977

