Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE2606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mZU/qAHt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7FNm86C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=; b=mZU/qAHtj4oqlx
	RmNQLoRZJh6/W0kdJFoAZNmzGhAQoT1EoY0le3a7bhDdWNpLF1FFBXrj4sLm6NInu5Achjco8Cb6H
	SYUM0voJb3PH58u3tJJttsL6Eoiby/ApHdgMaHoe9tFfrw6cYMqEy/OcEdrbfwhBGH9KQZ+rw5KqQ
	ngQt5VC74wAJ6xsHyFK7UwhA79W10iRQa4oaLA5GO7j/PeG1iFBTUESb1bNTimoq6++HcpjiI7eWp
	impn8b63+/DqxVkFiML16TZ3avv49OxFXrtmjQpPYlqppYfsVsY59f9bZ1EdpHjR8kyqNU32chtBf
	n3cDnaqjqyEzhbM9JcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSZf-0000000FjpS-1Ytu;
	Fri, 20 Nov 2026 17:38:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSZd-0000000Fjob-19iW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:38:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f020d0169eso6329215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196335; x=1795801135; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=;
        b=b7FNm86C7gVdrSWAciMdxr4DdwIs5kBpdLXegk6F5Dp+R/N2hsxC+D1P0jz4HAlMMs
         gKfm660ajrFZdaGlBBrubi2MTPPV8JMRuveMauWQyWeWKuLO2JPJqYRuBGAm2dS3oQoL
         jKsMsJtIh7sBY9qMQic9N0aPR4AAfX0KP3cbiifYIYKjNmffGoV9ZsYR1upNWGzsAh4E
         lb7X6+2JSf/J0RvakzlpVasEafgLNBAuJpNxMMy5c/K+yOdwZltI8oGspIyQnLDqyRYp
         UYw8P+w0dbJDcwZfKgAO2RocsBJSEiZJS+9BhtTytnyP3AKlRpT7Za3SQ1/xvcyhsr8N
         +wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196335; x=1795801135;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTQmlFfwUQU4v+NLA+yUDpQoUdLsc1gGPYlZIjQ7eEo=;
        b=MrhgGhhB4zJp+sKwKlDPhIgDtZTFKmMA2yWllAQ+JEfwdNq6YpwDljepD/q7Wx7ZCM
         ASZ4RCD+IOWxnWhjDZsR8vXD95o2+coDY9fR1PZ6ZTjidLMbNpihl/Ahe8FrHJPeXqOS
         sTnz7LZdZq0nOpSLIl9hH7ARchZPIBxT8Y6kKPSQCj13PUSTvODs30hibl9RDS8G3SE/
         vBEaSNEeDal7BCngMADbdf2pWNIp/Yn3A4Fkkh5eHwOSvzyTNtXiR44XRI7H+L0ZA+7b
         bNPUY2Rld9310E2yK1+TMUEnNE5ovovXr3EAt7ykvk9gsnYdohPevB6Ky6Wx40b/z4cZ
         hV+A==
X-Forwarded-Encrypted: i=1; AL+hErGZ1PjoieGuJonOkhOIparUl6yvsHzqQNWnX3E5bbVZFnS/WNyyUwY7vk2Y51vXFVoyrpkkIzFm6lz9yIpU+Itn@lists.infradead.org
X-Gm-Message-State: APuU4Z+QzOgMmJAzBaeGKl1xN2w64UVzp/lN9VY7TOa0s5AHTjQjHxmH
	Mqm01/YtBNyYO7l6s4YdUud3+iQoML6/kbNs3Mi/erHqkSUDSATYN6S2
X-Gm-Gg: AZFdTZd+X0r0RJmGWgivIuHBlEK0XiASwRc50uwOrJRW7Z0nYiYc19DCCrX6ueG/mIc
	uHeOzAU9NkhRSLXFVfiZ1njFojLiSmTlhZKfbwV8B+xL5+M/LgwxoRv9shWOWNWf82pYO2Zmaul
	rYnrnmjccQVL/Qd1HxffuFjsbnwNLgpxDflbblP3zW/oH4EUrl4+7+Gwgk5bYxWTitRr5fALxtE
	vIuWFWTTWKZ5b6kN2JN1vgKiFzxyRQUiqVDgshz+xUPmVMqmZtvQnFKXYQHMB7wPm5N+LojA0Yk
	/uVHNIgY2JX8ORloUUszZCDQOJPny0hnKAOXwa5Fl73kg8WMvjSOEwB4bnRck18a5aZJMkTRaPc
	xFVnc3PlUyTXOJlGusCy/3wAvP3zXso0nQjmh+ONA+eHLfxkbZ5nUQlyDyNxY7Y94ErMWjzYC6n
	yLbdmpvTzav3+YkVhVMP54BRO+UJlx/WYWpaWaum24KF11SqArYvkjONIFQMWKPe7+Bm2L+P0cE
	0aiU/diChYurCvtlMSG++GI6FA/Uq7U1MAUpeEt+lYP0CP7QOvffc+QfuMcGrxZLaVqqs6CuWpv
	DRR5LsxNYal6qKymGGOO3epUo2sJhowHjrm3OIB0jk3L3ce4LC8JlSOl4INQkko26B383arf0J9
	r4pUPxvfnOHIIsW1IyNxWIOP8mGAII9Q4aA==
X-Received: by 2002:a17:903:2391:b0:2ef:f01f:fa4d with SMTP id d9443c01a7336-2f03f1e0f73mr43801925ad.51.1795196334841;
        Fri, 20 Nov 2026 09:38:54 -0800 (PST)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc4f2sm18100965ad.30.2026.11.20.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:38:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 17:38:53 +0000
Message-Id: <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
Cc: "Ryan Roberts" <ryan.roberts@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
In-Reply-To: <awAay4FFj1_wQtaL@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093857_534198_37F8EA13 
X-CRM114-Status: GOOD (  11.30  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 20, 2026 at 10:02 AM UTC, Catalin Marinas wrote:
> On Thu, Nov 19, 2026 at 01:18:03AM +0000, Alexei Starovoitov wrote:
>> On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wro=
te:
>> > The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but th=
e
>> > interpreter calls barrier_nospec(), which falls back to a no-op on
>> > arm64. Programs executed by the interpreter therefore lack the
>> > Spectre-v1 barriers assumed by the verifier. Contrary to the code
>> > comment, kernel-wide SSBD does not provide this protection, since it
>> > mitigates Spectre v4 rather than Spectre v1.
>>=20
>> Nack.
>> In bpf-next arm64 has no interpreter when the JIT is built.
>
> And what about current mainline/stable or when one disables BPF_JIT
> explicitly? Should we force BPF_JIT=3Dy as well when ALWAYS_ON=3Dy?

Anyone who didn't have BPF_JIT_ALWAYS_ON=3Dy were exposed to speculation
attacks forever. The security hole was wide open. We've been saying it
forever. At the next merge window we will say
"you cannot make wrong choice anymore".

