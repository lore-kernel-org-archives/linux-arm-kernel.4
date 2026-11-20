Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE0D60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SAmAvV+D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyOZ1Gg9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gttAyrJ+wMHr+Glcgouy7cx0rJKje8ChJMiYhq7/fZ0=; b=SAmAvV+DV7svd1
	N6x0zTzJAGmcu39kiztdxW5JV1PtUzVXZjg6fR8cp8+9kHsWmelBw5InF1yRXSgqMQ+z2pd4BDddl
	pscURhkDUldli+bkpcKlThUr+hHtXGt36ZTJTnxd3Pw3Trho9Ff7lUg7zFu231ylro3Ooq7UrPSHc
	9bQp4x+eGERPY/hoUkbyRPdCk1oDDrHz6pJSI5TVMZaE1vit1Ojm1YDdBwSX1bN6zOA4DyWyaVQD+
	arz8GQVWalj9ywHOsmPXX+ud8N1SOnwA5p2nHLYabK0qSj1WIZUm2gPfKlkJKjtjdBQOKVx0eOyrW
	902UWOCHU6Yuvl/hXosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEXq-0000000DtvE-0DJV;
	Fri, 20 Nov 2026 02:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEXo-0000000Dtv5-0FKS;
	Fri, 20 Nov 2026 02:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6944E42490;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4572C1F000C4;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142407;
	bh=gttAyrJ+wMHr+Glcgouy7cx0rJKje8ChJMiYhq7/fZ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SyOZ1Gg9Bi5B0hlXjHgtJKD3pipKypaafZJWRX6z9RPhhaLrNC3K0s5CtSW5SI5GJ
	 QjXEXKdoQdXsroB1Y4DhGd3w93GCMQ9/rK8yJ3gK5mCktNhS7CusorMDYhqAc6AJaC
	 2Vy459uH56iFQsVVZp0sbFe6PeLubLRBLBrhC3xpRURbZJ9QZ83V2pHV77UyTpsbkt
	 53xPetogCbdr5PiCgD9HV+cAu76r1HtptgIxXszPEIqzO/2G3joApUxTcJl+uZ52nh
	 1Yt2LAcjMPQGWdT/pxQuU3oKRTaR6HhRWlZHsZG8qo3Z9iE6UKh8U1emQC9kr5ZNt3
	 74RLVDq+gmrfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5B53808209;
	Fri, 20 Nov 2026 02:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf 0/2] bpf: Limit writable registers in uprobe context
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179514240603.3989712.15825286425363086604.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:40:06 +0000
References: <20261118084451.12590-1-jolsa@kernel.org>
In-Reply-To: <20261118084451.12590-1-jolsa@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, bpf@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, will@kernel.org,
 palmer@dabbelt.com, peterz@infradead.org, rtm@csail.mit.edu
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 18 Nov 2026 09:44:48 +0100 you wrote:
> Hi,
> a uprobe BPF program can currently write fields in struct pt_regs that
> are loaded directly by the architecture’s return-to-user path. Some of
> these fields are restricted by ptrace, but the BPF verifier does not
> apply the same restrictions.
> 
> This series limits uprobe context writes to registers that ptrace can
> set to arbitrary values. It adds architecture-specific writable-register
> checks for arm64, riscv, and x86-64; other architectures default to
> allowing no writes. Reads are unchanged.
> 
> [...]

Here is the summary with links:
  - [bpf,1/2] bpf: Restrict uprobe ctx writes to the registers ptrace can set
    https://git.kernel.org/bpf/bpf/c/ca44731a7009
  - [bpf,2/2] selftests/bpf: Test which ctx registers a uprobe prog can write
    https://git.kernel.org/bpf/bpf/c/c21b0f82ca96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



