Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ski8wd8T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlB7pA1C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=; b=Ski8wd8T184mln
	7A/R6Yb9VchOntmHbYQ1aBuYaeumzJnc+tD0pdCAx5gIOLafm1zCL/Sw8Xe/B9/oZCDgLLG3RI/Sw
	EfhWlvatLbQLPueXYUE81AFYn+xydw9N1dpyi2D+Hms4hHKHBnAGelgDNpOhsMP0NzwzsvIgSeGfB
	Wva9MGpA+jTowWNW3rLDZ91K9a+km0P1ArF2T3olMeojUY6Ox5Y1G9ke+uE0f0v3o935s4YfUwP3/
	JuxBY+o5tXp7+YowrnHk0t6i0mK/6myXvPkv2u8+AC4XrJ3GdIalYpDh27mZlCtGRAw9ENNbSJxZg
	pCw4d5ntRpCfix5mgs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQF6B-0000000H7j8-2e0f;
	Mon, 09 Nov 2026 02:27:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQF67-0000000H7f2-3apg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:27:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso1170815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794191222; x=1794796022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=;
        b=BlB7pA1CX7WVeIqrYgXFEWrWern6M+RbU4dOGz+t1MrDVrB9+9y3tdU8AdW5uFKaGU
         iDIGwM/pqCEGGvg3+HPTaKKTRzBYoZyZPMkD5zOzXjlq6yM5ji7dajxVF7v3j3+XsWY2
         2+udrze8BAbJdit/HiR3PyNknRRZUGdhKkjRyGk9pgtfH+DI336Af670e4B1T0tzsOnj
         xwnVXytbc5z6weN6xSk2eFnPdG0wzNsvJuHg2S/YmslGr2rMO5LRoE4QI1N4FdtBR+c7
         pKRRUYRW08ws4y8uxjOymaAmXoRl+2fb/+S+SbaOg9DH2EiqMdrhnQES3ADhPvbZyXPM
         ol+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191222; x=1794796022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPGG++B01JHhD8ZJ8R5bYfPhVoS1brSducvhOfg3asE=;
        b=LyLey0FYUtZLs0vd8gP+3FjIIoYV/e0hhkyMu0PVf9u/yf9i/eFOhuTGnLCnlTkual
         +q42KhmioWFf31KoUokuxPUBY1X/KX9t9k8lWfiw1wYyvIlQvXf6XpzvZnJ/EI0y6vyC
         Blw8E7Eg9nbF4qYVC5RqzfDJxpK09vbS9Vse1ZH6aZqRWgHjt+gmQrVNxFtGVMS4JXyA
         jv9oHF0cbXsldAd6tFd58CTPVfIsaqlGduDCo2m6IdpTKrZzwMWS1S0g/Yb26v7S+XSV
         7Wgmw6VHxmE42Z9YbR2oNZk/3UBuL90Zr+xsHjj7396jh2Nwhi1DqzCBwXcNFoqevPj2
         Zuwg==
X-Forwarded-Encrypted: i=1; AL+hErEfVdjzm8EaIgO9nyq9aafkaomr7At0Qum23SskUa1+MbsbyYHfk3eDp0i9ZdZtadd3YaIMTpv4FTI0BbEdrCYY@lists.infradead.org
X-Gm-Message-State: APuU4Z8N5BNGAWo9wqZae4A7syyS/3qwu3SCSYsiXVL+UWSwn067Y1ft
	u1ZlmdLQ19uYX7sMWfGHKd43mef6Cs4tf4PVLFkTSfPL0z8FuqJUT3360x21zhLq
X-Gm-Gg: AYBFou0xucfOnKabgpFR7T6X2FHOxWDwF9T9e03OBIfu8AfLA3GDLquNyXoxSGSsrch
	Y0XvUgH+jMbf+zRYWgBMhdjLTMQOqR3u+oA9J6bEega6MiGozSaZ1DG9RiPCTcY3Rf8PvTK6X+f
	AFrAW1fO5PQClnLSEcXyrB+9LIQgemii2iKYOh68GzQqm6zwywYujdyQidDLXvllEqsTy9dwcpH
	cWn0jvl1kliOlsQG3izk16zPTJeOfeZW4sUNbi21hj9PuairVHGqe/wSCWfUJtd7RtqRCsnisda
	xHad322qA75HD/knsPjU+acenQPXf3jh36b0LbT2Ra5zvs6HD3jxDPFJZ1d6ZP/4W2824WA17jX
	yQpTD8boruqD2+3kpGohW4oCs1sIb/9iXOPaX40i0tGGPTW1yxDUg2Ph/ClTMK5wDTZaV9oj1D0
	H4JvAaSwCHiOjUMNCV59rBnzbKLyoCebaWKTLqQ/AHvkLoe7WbzMbxGrCdnOP4b2+JqvnV4zUR0
	+3zCe0DUng1WDFiIGRGxxnOPgfIyp3SPW0kFN5HRIxrs1XBpfgwP0xAmOyGpcFhXEITXjcYJOUV
	My3fzwKW17AnOofLtRoFhieaiYUr7Z9BGA==
X-Received: by 2002:a17:902:ea04:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ed833c440dmr28589585ad.1.1794191222067;
        Sun, 08 Nov 2026 18:27:02 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81708c11sm7011065ad.41.2026.11.08.18.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:27:01 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: arm_mpam: selecting hard or soft MBW_MAX limits
Date: Mon,  9 Nov 2026 10:26:57 +0800
Message-Id: <20261109022657.2828471-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
References: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_182703_912515_169DEC22 
X-CRM114-Status: UNSURE (   7.35  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ben,

Thanks for the clarification ~

Good to know there is already a plan and that Fenghua is working on it
- I will follow that thread.

Thanks,
Ping

