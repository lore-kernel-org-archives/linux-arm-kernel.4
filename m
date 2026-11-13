Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44281606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgCa/Mdk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T3u/Jidc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KXBsLbHqbNY0tnMKABAel74HWjlwLz2G94116zY2phk=; b=bgCa/MdkWNp2lu
	0MZDozFEWfaYmIgRzrVfW/eh1iKg2whPM5KdydIRphjMcfQeVn2WlyuNssivjjZUR7yPcEllNfw9U
	yfsG+VudXV9Mm5fXDrwoAHKgaemS2+LC3wxAi0iBJBcX61Bmk1CuqM1mz+l4ZNAuaIBf5jWOujgRC
	3uwEjZT6kNa80GvyCgHt4dp/rjXTXYwF6Blva8xoC7eRyhMBLsv+8eKTb0tCCoMtWb+d8jU0BGhr+
	xBT+zizLPy5asf4e0Hyei6j2jUoKI6dbRANRNituxmGHgYe6qHH9+ZWF6/W2a9URbTyAL6VMh7h+k
	ct2duPe36+0nuOeq/VDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRh6g-0000000BV8e-0bxq;
	Fri, 13 Nov 2026 02:33:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRh6e-0000000BV8G-0xqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:33:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F960612B8;
	Fri, 13 Nov 2026 02:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320E91F000C6;
	Fri, 13 Nov 2026 02:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794537215;
	bh=KXBsLbHqbNY0tnMKABAel74HWjlwLz2G94116zY2phk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T3u/Jidc7xu8JsGU6dv4NwbO97Wf1optilw/vxJkmlS2KkX5EFyRAVq3Z/PQkz1ry
	 rnrOGnHp5JlyShIK089TBkZWk/PS4A1uIhJynPInptR5Js/oTAEjMIhgkRmn8rHTBG
	 Kf+zZ3E8IQPqhGqmKMQO4n072F0rPqb7t/WZMVtOYyhELPqbg/Ny1jLvjqlN3f2j3k
	 UiVhZfjzJxbYe93CyK4UU13rkmjxUqbQFAP59fTykCIu9gBXqdx1CXoMXQGDtgkcl2
	 EZWIXg7EVE3JpfAISneQYtpz/tOo9eTcyNVPJv0eF3Odvq+9VheQjjytuefra/T7Bs
	 YqUYUtMDT7sug==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	yeoreum.yun@arm.com,
	suzuki.poulose@arm.com,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xueshuai@linux.alibaba.com
Subject: Re: [PATCH] coresight/etm4: fix missing disable active config
Date: Thu, 12 Nov 2026 21:33:14 -0500
Message-ID: <daily-reply-2026-11-12-2154998661@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112135406.71749-1-xueshuai@linux.alibaba.com>
References: <20261112135406.71749-1-xueshuai@linux.alibaba.com>
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

On 2026-11-12, Shuai Xue wrote:
> [PATCH] coresight/etm4: fix missing disable active config
> When etm4 device is disabled via sysfs, it should disable its active
> count.
> Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")

Queued for 6.12 and 6.6, thanks.


-- 
Thanks,
Sasha

