Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7732606D809
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ae343SvM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8gT+Gu1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9g83XKjzZTeyLQGk1ow/bSkcIG4drLaeQk6IwDzT3zk=; b=Ae343SvMsExqAm
	ZfvLLEsfKH7T0ggySwG4SW1QqGvq2y0TVwkifjTYs2caJz7BvTgMJtUrbqtq7LI8HOIxpW4bVgqpI
	JRBmEerOCJu8ZwZ+mXXs4PS+6iZNO8kc2Hj4cxX6iwjT7eSH0ETcg8xamhJTle/FgYNfclXCUTTaZ
	1yCZcWNbS3egWmWPSVX0s5ueEURG+fKeGZ+w44/rZEork0iz8i/BrJrbYfq+YJQKUTHu9cXopoMCz
	Vsz5kJpf+qjySv3zSF5LfO6icavCdEUA4iGMWcWmIlyiNGsoYOeGC+qQzDboauWzt8GOWkY5wbibr
	WZlj52hpnzGUtnYfBL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhgb-0000000EqZ6-3qUw;
	Sat, 07 Nov 2026 14:46:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhga-0000000EqYd-3JYk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:46:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58E6A60610;
	Sat,  7 Nov 2026 14:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17691F008A2;
	Sat,  7 Nov 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794062787;
	bh=9g83XKjzZTeyLQGk1ow/bSkcIG4drLaeQk6IwDzT3zk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=P8gT+Gu1GC2EG6dx1GhPwtW3AQ3Hi4q1a36yNnYxJl/OLu+iwpl94Wvu16pzz0G/A
	 5QHRXoCjGTyAHWAlVIRj98TndteskmkU9ucNAkuJF36AxYUeGYbAUQTe8OdF5K4UiL
	 pahn+xp+m05p0CjJh06nXEREjaFb3fMbi1ZMVlNo49jgBWw/AkyMRL+s3d+PjhRX5h
	 Na5H8YE69MmuwpLVZaTe/MCkaS87gOn3m13CsP1Osfw6jm27xfKQXkQ++I+SERHIFo
	 ++SHDUAunAnEGUakSOBIeOQk48QsBUUnwbfJs0C8JTW6b3hR6hRPlidwKRAdEItGb/
	 Fy1Vj7ZsEuG4A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 99A242A4C627;
	Sat, 07 Nov 2026 14:46:24 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
Date: Sat, 07 Nov 2026 14:46:13 +0000
Message-Id: <179406277372.3424803.9881358554237732478.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=346; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u/N0h64SRsZ/w9k8PNo1ZMh550o6eRNoHATFKEl4ACw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeW24/fGCKxyxVjrqtvQcjGH5M0Np/ZGbm/mc7+efaz
 rmlMDOroqOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT+fSb4X9i9Bd39RZRjiPy
 GhobP5WWn5403+JC7uGTC3W58h1m/vjAyLD4Kb9I66wH0THzJ+x/FhiWECJ5dOUqJVftsoaqPUk
 vGDkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This series adds support for the Cadence I2S-SC and I2S-MC controllers
> integrated in the CIX SKY1 audio subsystem, together with their DT
> bindings.

This is basically fine - there are some smaller issues but they can be
fixed incrementally.

-- 
Mark Brown <broonie@kernel.org>

