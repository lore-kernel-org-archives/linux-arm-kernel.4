Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QZJlgzP/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PErNCUXT;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Y9v4pOya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Content-Type:
	MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=; b=QZJlgzP/4LmHJep4rKJnjqKRd9
	A3fFM8lr5+rBTghCE7J3G+do9MjLlrylz/0+YTsju6dWhOOV5vn11Nqp1zmdkfLTahdvLZHlPc9zb
	NIayjR/fR7tyujEkxGQkUtYbsmANIBSAhg3TstD8KmbpkUfjVt+g/mw+GiW6+NK66IrLfttKCjLKz
	/cXVIkGufHCR+MCC3v+YYaWYqxNFEbgparMSIvvKLJ7wthSeauvw6581WqSB9M/LBX0BItOVpobLe
	1xwRrhBkiAjmHor4gOq5vNRqEEOemVs7+UcoOVQCtvDayuAroUE2pt/WFdwKw3esGxXODLnf4BMpl
	cODgqeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmnY-0000000C5iq-3MvZ;
	Fri, 13 Nov 2026 08:38:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmw-0000000C5Nl-34wO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=; b=PErNCUXT0VkmNYNBwwoNPxJnoG
	Xq+QQraDqx6wGLgO5EhrMdcIErvasF5Kll8LX4NIzc/YqnBn+q2W0ad8EB+gN6WGyatyre9C1Scn+
	HFKxnOZ0tW1QFs36nI/HgB+RAWeK4oMIxCZsnSJe0/3b1RWDK4iLk/T9Yx23LeEpn+GhpieSZU0dh
	lmeiDeV0ygwKKcnItE4sKYrgHbapf30Kpg7ivt2F6Vx1J8kAQlq7CG0WYUMpGyia+Yg/+Cg8YBWaH
	KCGb5En1kDS+fWSBcnRKYq3b0X1/r89pxZc+rRYTUd9CY4eLAo7EPAwGurs8NDtgwISz6xc0DQZXa
	RMI1Y0sg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmu-0000000B4r6-0dor
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ed28bac8d7so2980905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559053; x=1795163853; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=Y9v4pOyaS9lemRIxNyGFz+asVqMohjPnn7Xe9Nnfv8rdpelqkiVoRzaDr0hy0mEIMy
         LDe2ufX/INSGliHQx1R2ill/YQ5i/yeOWIuvgLP6feWaTFItUXoQtIVySpvQlGXhRAna
         FROSSOKZ0XkuDGe97ppHOXgwhVOaEd45OGWg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559053; x=1795163853;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=TRcn0a+T3fiDGixzOJm82u3irK61cko+Z1CT63GxxfjMS5LFjowd1Ftn9KCL7sAHJl
         XsoH++jkcM8VyFfMu1SGhxYyZW5Sm5UAOumxRJj43FNrjBsEpUdHEv83PR+KY18+Jr5D
         VjYuN4T82O0CNoUucgl1Nm49NRs/eDBIzt68INInixTH2unBvJMVAGUof2/o3XwLXyP/
         wi4KrCx2kHMGfN8Oz1kHjpXJYDI9T1gTXP40qZK+e4tX9vDWXoQox34WSv//GGmz0JfL
         DF+UppGD2Km6f7y/RAdeF2fN39yKl1QNNhne0fJOZ/XGhQPIq7GDg3XB6I8cKkfjsQ+x
         gL+A==
X-Forwarded-Encrypted: i=1; AL+hErF1QccOHdWWV4IP4xoHw+kGomSg7lt50hcoddl0suVgfK8S8YrDIfyc+ARew/+bltu7HJzjT9vjrZruqNXHMSMI@lists.infradead.org
X-Gm-Message-State: APuU4Z9ecDFmP4q3ghOgYYp34t25xZV+IxpCQrXL14J1EyPpg8hxxSq8
	0e4+f7cm1+hp514Y8riLeGmqcFH3arVlXTenv+AEx6dNyjzKNjmLL6MqG6a4q8mWY+s=
X-Gm-Gg: AYBFou3c3+VTcTfjfYgOhqTGU0hjimGmzeixIbCE/1T+ckf9q6cLAepSfSvoEZofQ+O
	a2YMSveWZldGyVDDRywvpWxIScb/TmBlCvM5zsBVlic0ui5JuPWLFTQDLoOosctVE4Kmey66rte
	w9WewNLFVER9r7FfTIEnc5skLSXRnNL9N0BFSFtlX8Ewfez1HOC9vKVQfh/epCPuEsBDWFDUvsf
	2/Qmbk5o9T6bU2VgZ3ug3JK0mtdsQC+Xh2W6oCcYL3DjvF8viiKgmTfcvCj3WqyvNPxO1iS1ZRS
	OL2nKu+3/PymciAGQ8iNnzv5y3Tao6ExgMtc0tLsUjjitct4HXENP1dFuIUQNYffk71uALOYox3
	cABHN5eBYr8JB4eJfIxSvCI4UgIYPe1icvjKo8ofAa737up4fXrbs+dPipZoAaPyqMtPEysWC36
	7fwEoVoyiI6mGmmoeherLx1nos3RIKJWeXc3vJYnPL7qMDCsG8KUq/b7Sisnihv/enmAHXXJa3p
	obPJ7472Umq/UucaIBAyRxsYWT41Y89O1ctnnrw7sPVNNOr7e0oU0fIkR7EA458+VbJWuQF3kFh
	0Ln+duX+mo3UswMu+Di5WLLsDFvZlA1AiSCuHiaSUB8pzWUFGmy43zXLy7GNgSb7myJ5RyOowS1
	XWpraWkyntoun8gcuwhXmkq274xx59ZQZ/BfQtl3fjcGSY6Nmn3dJkFGFVAE4QNBF+HiSnGt7wm
	S+jaK74JVnFerixAPc0wFaH+O50hF6oHMVHFPCvxpbiTG6aJ2/c3iqRt9H30qVsVSn0q/V22I4Y
	wWRyyeg
X-Received: by 2002:a17:903:3c6e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2edf1ed6cdemr37400075ad.16.1794559053599;
        Fri, 13 Nov 2026 00:37:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75ebbcsm6475845ad.26.2026.11.13.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:32 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003731.5754ed6732d351dc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083736_149062_8A89194F 
X-CRM114-Status: GOOD (  11.28  )
X-Spam-Score: -0.2 (/)
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

Hi Randy,

Randy Dunlap writes:
>This error branch should return 1 since it handled the command
>line parameter -- it just didn't like the "value."
>
>Returning 0 causes the option string to be added to init's
>environment, which is not wanted in this case.

Good catch. I've fixed that for v2.

Thanks!

Chris

