Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D48606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0w6iYsY0;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=VlopeV3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:Cc
	:To:Subject:From:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=; b=0w6iYsY0JyWfkrDzZrcig91Rnl
	59LQnM8DXSFPu2RT5cj0S/oMMqoqSFuRs4qxLU+NJ1lWMHEntkKqC+S+2GnkeKhnq4xxlQwoguHGF
	b3N/IeYIbRXyoj6PAJkMIegncdLu3HZwqGSMwNuZqdDOfY9O+aDutdWVtorVjHP4CmONdKcs/nfX/
	temOlaiBLb/GGVQlsCOv6VvASf6XEp89ETP1J/sSbYJXIqDLA/Oh1a0G597PTHh5wbt6NrwrjKRn5
	CBGuG4Y0hv2RDsu1NLrgI3QT3yVJZIMZPAi5iqJFuomuUjs12lZ96CBH9QHEDvP7JVskyeSWwKtKw
	dIgx29/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmn2-0000000C5SM-0Q8p;
	Fri, 13 Nov 2026 08:37:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmg-0000000C5I1-37xK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:30 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso653968a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559042; x=1795163842; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=VlopeV3NPudvCaC3HxB/X5NxRbNoMw9QlK+rR6G0mS7IS5xA0dxL95sQhV8eIXREJJ
         lNF10ZlqbKImfD4fz44nnGhITeTeMDIiEKGZ6iWyQnF2mx6Z3gyvmpz2FCGe4H0hDuj8
         ShZID3YARjpwDyPzCDhicryL9XQsmVNLOuqdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559042; x=1795163842;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=cIalW3ATFVRUMC3Yx9yPp81ALwF9PNxjBIsCuWM7s+CvaBvZkpZr0xnSDgXPNedoUk
         9aZLCu/xn3WkbGVYPIsgyo+cW7X7aTdApfNO0oIySatqy/on2KQPMpHbY9J3fssJb1KL
         eZbY6tqfUS4LS8sIgnoGkpnUBnvJWoIgLx2TSNDcyiBqMSYuXYXE5cHW+nWrK0IY+jvi
         io6XY4xmndha//geOpsh3aWc1yIGu4gGPUFTSUOh8rE4wyR2cvebjjL1GMZTpTinvjaa
         iZ3/+EPDL0g8A0R+20fn84ReGHZ51el11SpLv7rrcZrGEr29ZIKeLe4E3oPiMlN4Ou15
         nl9g==
X-Forwarded-Encrypted: i=1; AL+hErGu4qsHBSEz1Rkt6baTUpZJnxoQ4IqJ9/GC2C5P2EEZMewBvJHHolJ6X+sH+C6HQ/BfqzexchkAhxhQZ93tw1bH@lists.infradead.org
X-Gm-Message-State: APuU4Z8ohRoe5xOlh7YnHJT8R4snbOQE4iTYVoAdhtrgEPySQoU5e3cG
	wo0puX3vJ+zOyk7fglqe3vrFuJitySGFjJv+fbR7I4R2+LjWNkpL7vid//oSsCL1qUU=
X-Gm-Gg: AYBFou1UeHwxmBzFCuW1c/LWcHKDhCbOj7Trus8w2R91e2dL+iRr6J49YYOVDy2WfZt
	tajaMjHFTbjCIlhzbngPUa7FB4p9ErY/1xTOP+a8bl6p1u+K3ZLYclFj8t9LznTsbbbOG6BRrUb
	h33YNTrE+99P8ekis0nKWoyAESJz17OqHZZ4TSfcfjG33R2GWibMJbINK+mKU6eJ6XpPSDRrvGx
	sIbioA+kmJ+fnhUC+jPCXgV6GPwBCw7GnGAzavBiEugVwaF1PYBREGodfbGGJOCtrA/2fr05JFz
	NIHpzqHkEzRzxYkFROcYS/WH2o+5AFBkYRWdLHfhbQXq6eLox6oUHDFih/s3qnMXBDqOeJE459g
	xGU3bLLkvczzSWWWyxVzLnMbNa2gwyDQKu0/7Lp/E8LEJKssyvTorNwMCS+Q4XxB2XdlqoEwjsX
	JwIWXVY2ED0fdrAawJrZv8I+/OOBhtV4dZScetYDslOtS1ws+pE0BWcV/sVL2H8CUTjUx1f5okL
	rNunOgbiuflyQaewOFjyHT1KcFz58+b0z22/iZcCYi++1zsS6AdAr7kpjv4uLObwQbeGl6QcmuY
	Fr0nBjMqJzEjY6F7zCYFQ1UYsyR1IFQn9Z6eLmgn/joO7jiBSZH34hvdO6/hRamHblTGBOxrkuy
	3QE2EyK4YH7XN4QWmXlVPJxHamTU/D1l8JDuFCIfFswkFFdxQNyCkVlvLz0z3a8eqvfQ/7ZmllI
	alVrHzBvEYpNcKFPgQHnaybyaG3sBjd0R5WaI/unGyE7KgLuJX5hcKwKs8qWI=
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1404120a91.24.1794559041771;
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm8749569a91.10.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:18 -0800
Message-ID: <35b84656fe82fe1cff0ba3bc55ddc72dde70b089.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/3] scs: Skip the shadow stack end check when SCS is
 disabled
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003722_793062_6E8FB627 
X-CRM114-Status: GOOD (  16.36  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

Make task_scs_end_corrupted() check scs_is_enabled() itself. It is a
static branch, and it folds to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 include/linux/scs.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..29ec2b8cf7bf 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -45,14 +45,6 @@ static inline unsigned long *__scs_magic(void *s)
 	return (unsigned long *)(s + SCS_SIZE) - 1;
 }
 
-static inline bool task_scs_end_corrupted(struct task_struct *tsk)
-{
-	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
-
-	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
-}
-
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
@@ -69,6 +61,17 @@ static inline bool scs_is_enabled(void)
 	return scs_is_dynamic();
 }
 
+static inline bool task_scs_end_corrupted(struct task_struct *tsk)
+{
+	unsigned long *magic = __scs_magic(task_scs(tsk));
+	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+
+	if (!scs_is_enabled())
+		return false;
+
+	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
+}
+
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 static inline void *scs_alloc(int node) { return NULL; }
-- 
2.56.1


