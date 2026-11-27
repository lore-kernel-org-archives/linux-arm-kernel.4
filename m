Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC22606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vJDqBu1+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZBYG0roX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KxLg6Gx/zGlioMjDG7k4tE06ODo1W3pNMbUCbFfp87Y=; b=vJDqBu1+Xd1iTv
	iFKMgmwdRbqdxXugdYg7yk5wfq6H/gN7IC/iVfEQpolFF24j/nXaBcL7XAW8JNUVOmOJOVtcUoTYf
	1hG8UzfJoDDheosQzfRoTlwDbUhYxld6k9itsZ5RyBhlOIZyzAWSc5pqbrLLTPmFjMlcxZuaghoVq
	qz67c7hsf3UwVY7oxnhxkMzfeOxBbHgcxk3DAa4dFbulLOBQvhlV92+7LhziNTITs6Uudya696S1J
	Lg79AwPryG0j5a4u62HqlV2dqBgjDd5gNlc4UIuxw3DVmGEJaLeIKF0io8azhIzV6hZAu8hWG62wg
	WSoudrVrxmU1XjKuBjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzL9-0000000HBqy-0COm;
	Fri, 27 Nov 2026 17:02:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzL7-0000000HBqY-05dC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:02:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 586274040A;
	Fri, 27 Nov 2026 17:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967F11F00936;
	Fri, 27 Nov 2026 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798943;
	bh=KxLg6Gx/zGlioMjDG7k4tE06ODo1W3pNMbUCbFfp87Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZBYG0roXlSFQCiyazn2M6kil0iU0nWj+gXJJ8FjOwJGMNnIO4++FGk70E6LvTcGLI
	 pbGF8iqEAGEK/zRYx21P8HMuk1c2Tab1ZU7jI9pFwuxmfEED0vAwixWew1YjHqa4cK
	 IP6YuRLcvu7MTlSh3ubjMezkAcJwMxGA2EFqZMtKW/eNUoc1NJVvLH2LdeUBnvlWza
	 NtRJqvjCQrUD+8EWSVlZ2mkiYbfCMszP0LR2lig+fjt9uozxiWmBYzl3qo2La8TbIA
	 LW0ytFjitfhYIWaid4WO+Yg4jdbGmzCPKQ8AWI6boJ6d4rceYl6KkmSQlFMMY8VSNQ
	 IsMqNhea9ZK7Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Song Liu <song@kernel.org>,
	Kyle Huey <me@kylehuey.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	bpf@vger.kernel.org,
	alexander.shishkin@linux.intel.com,
	Luo Gengkun <luogengkun@huaweicloud.com>
Subject: Re: [PATCH stable/linux-6.6.y 0/9] perf/bpf: Fix NULL pointer dereference
Date: Fri, 27 Nov 2026 12:01:17 -0500
Message-ID: <2026-11-26-1-daily-reply-0029@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126043458.2394658-1-luogengkun@huaweicloud.com>
References: <20261126043458.2394658-1-luogengkun@huaweicloud.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> We hit the following problem on x86:
>
> 	BUG: kernel NULL pointer dereference, address: 0000000000000000

Queued the series for 6.6, thanks.

-- 
Thanks,
Sasha

