Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B97606A8AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vw+Z4A8q;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Xy3KArTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Content-Type:
	MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=; b=Vw+Z4A8qdwzR7z/O9tvCFtUY1w
	g/DEzv1hOfq5vWlzW+9zBmtn5s+SVYgF629lLebILVYSpJFjAdFJi8IvLUWqBsnVrMuuBFgMD5tmc
	aQFRP4bL2M6CvkLd5wtaRufzlJzohhHTcOBFXSAqO7zqAiJB/38fbfl3Zn+iALE0RONu5zGf05JYN
	lWI/cOXhs/Bh44Q5UY67VOyyyFmHoPXisNl6pb2oWe3ixinOLtrgtHKWuwedZR0jsRemzZl3w2KQ8
	MK80bGGUDqcAvuwWYS1vevNw1fWM+Kh6Eb1TtlkP7ZdAMQl5Fm4xwv1rcOiNaXrnENdPpHNsXXW/Z
	XMKx3txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmnT-0000000C5fS-3Bsi;
	Fri, 13 Nov 2026 08:38:16 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmo-0000000C5Kj-1XiM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so333547a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559049; x=1795163849; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=Xy3KArThCW6mkPlIOHWXn36On0tvWvLRweMMZsRroLw091LI1JkZCS8o58zLwGSYEw
         s1IuDdZVAAGZJlHKK0btA+dqR1rV5ANLtpdaCoew2sRvX2Hu86A9xMXlVOTaUyMEZkGz
         JpEgqWa3yK6I886EZLjkBl6fdvuXLtqQkffQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559049; x=1795163849;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=C5HhYvMUNr9yJ7LdIYEcXORlkwjQhwk6M7hXqhzyDXD8+T0LzDj7tIjhD3KW/FLeOI
         b/ErfklA8eWDLmW7/TXx7hvCHbYvhQACiHzxksdSmwoW9IJOtz0eyCXIvBO8WaIBDfZV
         L0yjZc16qikDgVimIAzbptjXUfolTMtoMb5c0kjPRpa139hpeSepA0k0eDQBNNbYBL8G
         +v1WY5wmqCAG6G/90QiYnD6lzflLMHLI3tL2Op99NqGtfraMgEObjYqI3vqnMLkE5Mfx
         RaQN3BNY1cNusyqywAvHhRVU2VX0PKLy43wWs6zQCAqs9tMhq1uEKIMVcxPH0xIyVAVP
         uIsA==
X-Forwarded-Encrypted: i=1; AL+hErEQq+/YyWIjfUhrIe2zYtX1Nr8RGTR9muu6b5xxxAFmIkkvvlB2KLS8LCWNE8N2cjhyaLKi0tSHYa7ItYVIikIh@lists.infradead.org
X-Gm-Message-State: APuU4Z8r+A3+sn1UkTi2Ergj+8RLJDmT6P3ZHAsIvqFnIaYAKIvVl9r2
	T9QiKr8f9E5k03osbQkX0oBAEA6jmq00lcZQEIH3lCQ/Rxm4xvDibbdiXUnmed6Mpn0=
X-Gm-Gg: AYBFou15c49cm44uezu2AmfECqKBuEzZR91TKm7ygBLFvCSjcih6+YrQc4wIIP6yDnX
	gJu352GLAyUjZRlI6EaOU1ZkVDtnN3a8ExsEATIzl04z7cOKfjpS9TggvlKnZe0XYHaEQlARS4w
	mqDIMCTmP3MNYzakhJCa8o8E9eYSwL8RN0ttOM0uN2ORuKnkFWhvVX95s+PMJNaHWyZFUTS4x2h
	KSOkA55cSNwXIckFpxMUlcDwg0ax2Iisb8oW714zpLPeHIpUJW0Lq7cqUtTJExgT7hkLekgNZf1
	NGPb/KLuj0FQ+984K5q9HvxN408EcKifYoZciSlwCT8bPClCb3BMzriC//jnDYZYwQgRjrUYqLy
	FRGQUA63DX6tjOGhi2rhXudR1BELa0g0BzGn+UdP+dF5YDSGOAyqLTUYh1Yi2w2nzOVtwuhp9Hh
	LYNpyfrMfANoiBn2ZDTCGzjDNkW1/w27EMabyTmd8oNRCUBQUJ7QOPdvJANm191/Lw94KLgr/D8
	ezAH/WYswQhRt90zOnFRyt+KqCYaP+KjqucHk3IuNSx/+KzlmUlHBdbto9frYy+sOMH8ckDtcSQ
	pVj4qGhGBEfejEJHF46LexBNxq01m4KG0Z7yc3OvkhBzEOEaGP51AumTq1wx2CoG3BTBJRCImUI
	AAOLBiQ0QM0SQDIdJ4WmD8zbSP1zoMIAuHfiFlzBMGLWklhgsTE6jLwfYWfVw1yaDmbgV9hZAuY
	nZPO2aRFF2qHqlOhGl3ut3w+3bekAqs7zA4t8EZSr6dD+r3kZM9Yx7B11FbjEAevpVbd9/uydow
	27WZXEa
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr1782230a91.8.1794559049401;
        Fri, 13 Nov 2026 00:37:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3384750a91.6.2026.11.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:28 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:26 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is disabled
In-Reply-To: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name> <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003726.68aef052ac869097@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003730_652780_9395DDF1 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

Peter Zijlstra writes:
>How about you push that scs_is_enabled() into task_scs_end_corrupted(),
>this makes less noise here, and also keeps the next patch saner, no?

Yep, that's nicer. I've done that for v2.

Thanks!

Chris

