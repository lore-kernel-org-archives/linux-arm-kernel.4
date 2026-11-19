Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12556606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Af964tjn;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hHmJpDOR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:From:References:In-Reply-To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=; b=Af964tjnkPAGeWqqzseW0SToOk
	s1zVlDNEuX13BXiaukj7j2qa8RonVB3N9VGXqwKbB4KQ5UjVjLMAeE5352fG0+XlJC7ETndsDHmnS
	WUps3qcWGUjohst+ZAHH1VA8SzjHtiHvkP/O0Cg+bzIZQsu5z0/cV0EgD4yei4Z49lO6iNMz6+T6/
	5iBXmyd3bohLnl0wmTpILnyw+VN3EUK0KS24FG6Z9Wp1kbyYudQFw0gdvJ1LOoaBvkpALnAMek9fo
	E6cLxDouyd4njIoWhMVAl8py1lqIPJSM8OotluGU3Yi0cpn1LVd37c2h9U45fExsM8DI2l1C/jW+9
	pH9aPIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1XZ-0000000Butj-1erM;
	Thu, 19 Nov 2026 12:47:01 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1XX-0000000Busr-0eZ9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:47:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b4c685c751so18192597b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092418; cv=none;
        d=google.com; s=arc-20260327;
        b=RB2GoIvDjzmJHtfVVbK2/1CilQxn1/B5fx6zxqsPZa+7z4W4+ZEAiirWL27nIOYMuo
         jPvCSq68T0OJE1R6wDQ3M9v5Xs/xMN+guv9LXK0c5vW+dsysumAbcD/OWqPdFPK1jmY5
         XJsM+3xpdYgBo4dCqBQm4t+QhyaVWtBYLJICVETE3bBWLlclNVNP8DSRtpkoekN1axQg
         JkzYB+EfjgdpGb7pExYTjmIXCFM+ofexGDLCgF2TKMI1ajP9WsZgR3BTczx3ECWaBRSg
         92v70lXfkkqAjGmydgTJVmmCkE+kkFY1woYACG8VrHFUKEyaHxAC8aJe8T6+nPkBK/bZ
         qTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :references:in-reply-to:dkim-signature;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        fh=M2Pl8ihcj1JtmuuO3RzXfUFfNNiKGSWIGQBuNSOcw2M=;
        b=UVcTTgl+JgYcsAK4SpgeJIeB0NAk6qbgj87HdSPoNimK748s+surfCPPC/qr3cmB9Z
         eH8yzm06iHhgt3N+mj6aoSP7+5VfxhpZGJ/GmwtdJd1TD7fNoi1mE9vU1VQHzFOK7/Va
         mkDX0gzc/dChC2lwigALuxoKXrxuRpoZL3w13BD5f0Y6Xwphs2pvVG77Pq8jVDLxrA3g
         8yHUIJmUM9wZaKgJb+q68DDvbOpCNNjq0hJFCOeJmdm4+2VkqJul11m8Xf7c6NRjVkB0
         hdGK5YEg27T26uAvwIKx2wyWZg0TBFwguFNItm5+pbamgHFeWZJjWWga/JxVL5pVRtov
         xCoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795092418; x=1795697218; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=hHmJpDORQ6fs/UBOXgRJ3WjtOMB01GWP0N+h9FocWG0rxQt6xa2R7GXthXssxT4mQR
         lcqV4OYoubAyhXxIV7eW4UP4iu6mM34QHqZTKVOWGK64A9aBIqrpqBkOtWe6r3V71Tuv
         Jvd3t0dgOpUQerWlDgRqdWYLSbYjZsiqDa0agq1E36I7+nDKg8hkgw7XMa8A7pVWy5eT
         qd96nSdU0u6oAXIrWMi6YkBBaswbfBzT4Xe8EfwjjspcFb1QJ/nZwtirCwAcZ4OBI0dC
         qALg1TMaNs2xMofJIhxYKdanYgA1jgjECVyE2cMddhqxQ7b6PiM3LXhiDzez004rl1Zn
         oGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092418; x=1795697218;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=O9fUXS4zYrVWTtgzJy/0mi8H0NIAZYuGmaqUwBDqdEH3muNs1i0auyMIpc7hoeejZ+
         RM+S6uE1HwpExMtCdpfxfJTuoeuJgj7KE41CxE7Ap2s17jL6oxAnTu3lN9CF5A3Fu/aJ
         kfErF+vuKLz4MRJMWsdFvNzCyQH3WORQolZT3CavPfyh8HVRCPxIK9YOa/Yz0FFOgJ7I
         bwBd9Qmw43R0E0lGmZy74Iph+9fxnW1WRf9oKhV+Yfefb/hfUJEvYmeHwYyhdrcm/kyo
         wpXoip94Qgq2LjDvltghTDmQmTs7jekLpxxqLkeqHWZoPBdhmNvCXAnpmzpYZyn+YIOI
         H9Aw==
X-Forwarded-Encrypted: i=1; AL+hErHgFNREbxlm65DYOZss0n+iMdcE9sZ7+/RdcryvG+fGkA2lRNF1R7MMn47NUeDgSbYGiHpLrATSPqvwVQZqk0UQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/gK4cNZkIYk/nRKYTwwxJeaqtw2uSfvSopbt7ztjLZidTrgs9y
	toVonZsp9nte17wkymfKNJq805i25+EN5DNCVzWdB3ZucrmXLAN0glT0FkNYLqRj+rEwcWlXNmT
	9/wTuMykbbUB/yQjoI5t9zwFWNxv35fIu/mIidFP0/g==
X-Gm-Gg: AZFdTZcKL0IsbL9BojmNYcmwP2BTq/m9GbqtXTNj1bVANG4v2u5lNif2ApbUJXlKs+D
	bSQreMyqjTZKse9c/L0hHaNT4/gJ+ROR3+5+IqcMRU6prALhQsb/PUBbXhXFb+lJiI8GHJ+YC28
	JRUx3flL0rUxooby4pf1j8GPSaipC9WZ0aTzCQmCHnHWE3plftAtlDZpCecTesHYbW7rnZ7KcQs
	r59kkNLl1157VFSnE8wVHEBuplnAKdl7huMaCBJ+fCrzz8pHSPLq5rGyAnzgbvPFuDxp2o6I/qo
	T0dKakzw9zn20WqNOI9esArLOd0XTIi++PZVa2NYyfEpH+0M5tGJr3qGYFLstVpxRtMYR2jlojw
	YhqJDSZRD4A1MEFkLr4pdlNGTgM79RAPzTM7vRQ==
X-Received: by 2002:a05:690c:7405:b0:8b3:3fe5:f6ab with SMTP id
 00721157ae682-8b4fecfa349mr19565437b3.24.1795092417770; Thu, 19 Nov 2026
 04:46:57 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 04:46:57 -0800
In-Reply-To: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com> <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 19 Nov 2026 04:46:57 -0800
X-Gm-Features: AclHuK_VCp2Kj6TuYw_2lEwgIiu0LS1C49sX3AV2M1eYDrqr2PQ_yG1as_cK4Hg
Message-ID: <CACnXVne49x1JEPZhCaQzofGDuZa65F6cRpE5Pzj=3s0rzpHUcg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
	Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044659_202932_0C4A0D88 
X-CRM114-Status: GOOD (  12.50  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paul,

On 10/6/26 6:21 PM, Paul Walmsley wrote:
> Hi Zhanpeng Zhang,
>
> On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:
>
>> [...]
>
> Thanks for taking this series forward.  Could you please rebase this
> series against the current riscv/for-next branch and repost?  I tried
> pulling the series in, but it needs quite a few updates since we've
> queued up quite a few patches that touch SBI.
>

I've posted v13 [1], rebased onto riscv/for-next at 642fb67393c1. Could
you pick it up for the next merge window?

I'll address the crash-kernel kexec restriction in a separate follow-up.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/r/20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com/

> thanks,
>
>
> - Paul

