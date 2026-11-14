Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D20606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ou/ABLDo;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dn9Gr2vk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=; b=Ou/ABLDoMx5q71
	IZCgCGJG558n/BaFn6wEqJx7t3QEJwkH47yCbE2lroAI63NKLD9cW9GoZ+34n/HKhWUElVb2X/8FH
	j+CkYyiY/LT3bFvOTvMMowvTvWfXukeX/f6Hoo847H/KrvWpRG4KH9HnW7wHRmyP6Yv9LaLSOpV1d
	f3O6pZzfrlK15nFWwcArFhaw3Bgfgt0528ONamVw7U50lJobMlNhf9ABQVsn+vN+5G3zEJr6Svw+m
	jc8FEuMqC8fSRWayrEhYQlIIEkVM0pcbjlpDW0ZKXTXQvQNetXxwukulC/y7lIhLkaRHdIeLQGV5Z
	llwWDTJQc+FzlSdSt8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4DY-0000000FDUN-2wPm;
	Sat, 14 Nov 2026 03:14:16 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4DW-0000000FDTa-1p0j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:14:16 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso687859a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626054; x=1795230854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=;
        b=JBR9NaLgLnVpn0zmYa4LkV3LAL+zJxQpm4xV/4wAXLfdB4DNsAP5A7fN0wQobRnfaX
         q4Nln09FO/QsrjurMOlBoaTvyT1S+NUBH6VnYARBDNiA52sLp+GYCCOX/r8elUIHWb6x
         /O2LimOu53sldjx1CdDvnb6CaWqcUlKWNW+VP6SJtD6QWshYUIVVVZgqt5Pv0O+vP8gr
         wqHbb5H9d68Q3IP0oPjKALtH3idmHtAhRbjhrCn25ohBZKKJgduxF05EA8TzL1lybCxW
         glEHsBFh99jGq4sPbLKu35HL1X5Vm1LSXqQpuUlnGbrfubByuq5t7CD/s93cdgP0NfbU
         ylIw==
X-Forwarded-Encrypted: i=1; AL+hErHa7B4cTZSkdpsh6Cz43ll2GfzjGMgzkQt75kuBCdhESgsCteVEBbUlgBH0Hdsrd9vVeEpkOc/ETItZbKzJJ6V9@lists.infradead.org
X-Gm-Message-State: APuU4Z8uA5veeoz77CiBkz+3w7thYDtIRF2YOxRVWJnpdV2rpChSa1P0
	1K4Khuo31j2h9yv7EGPvY1j+z5TEnTmQPsD1MGrkiZrZEMfvPwhh4ReWuWJY34KFNOdoE8Kw61G
	8nx1ivPx94HzysrW9wQfx/xBH49b3G33X8OfB4Bwlyie7P3wLcXGWibsammRUKgCPrPh/N6W14k
	E1qYI01BGMo/InAIyZeaelIaFDPLHI8QVZVRgow4yeuAjKt4zIfjLq2q+xuPZM//t72cqeUAzNQ
	yvGsiTx7L7XjptbW+gum25tIuYCBnCLW4w=
X-Gm-Gg: AYBFou0VYN1Zohrr9YvPf6bCNKWNUfWClBEiaj6r1+um+2oISYAXSXvEpVFWCtSe4f+
	cu4//pWlwR/qOB9d1FanAfo/pDQLdTbnwK+S59GWGwqmw/RPiPiGGlUJ0mIHNeco9OfOTVNrbi7
	3x21FLOUaf+8L0dHR2W6e9srMZikGfMucJHFnNushQeNV/GVftBAzeS0IEK7rPdsFjQivHkOTy0
	FUD3cGijq7daJeRYeRx1jtLtt5lxrNR8NAvIT0WLHMTu3HNM8DfHyf1pw68FNmwUfeZg6p2vXuK
	PTsDwaYFnsCOMHZM/kAWg//N3GMW4I6wzL0WJOs1MD341Zm7AycmAsR5Wd8WmhP39uFGG+PXsNb
	u3K+djy5QptPzH7cJG++47yIw1YX7G2sBp1srwia9kqj0iokhWPYrfEfzVs8NMa9zqRo2WLT8IR
	L/kURcQjrQ6iQI2tQ//2k+Nnv3TObGDtIJkw4OlLNv
X-Received: by 2002:a17:90b:5687:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b1b0a407d6mr4428281a91.17.1794626053582;
        Fri, 13 Nov 2026 19:14:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cca69asm8976781a91.5.2026.11.13.19.14.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55bf3e01e65so1894901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626052; x=1795230852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=;
        b=dn9Gr2vk7WCuOcrXPu5w5gse6pe3LUYCTuisiQB18+4Vr2dssQccMqsYLCBlg3feh0
         sEuXBko0t2/VV5a5jtSc4b91DoYQX/xWcyeOUL9xMrt/gynSEbaQzdPL362F0/woxUbv
         d4Q7Cpip0U/nW/6mjcPS2ZByxTQiXV+3PA1iQ=
X-Forwarded-Encrypted: i=1; AL+hErFPPGqj9adByzfvaLKQs+XtsfgKzRAODMLiIefy44Gb4Xu5Uzdz4hRT5LEH2NYJhc4tqxFRX3/DbF1kckXiFdXr@lists.infradead.org
X-Received: by 2002:a05:622a:54b:b0:55c:cfe6:80c0 with SMTP id d75a77b69052e-55ccfe682cemr88491cf.26.1794626052116;
        Fri, 13 Nov 2026 19:14:12 -0800 (PST)
X-Received: by 2002:a05:622a:54b:b0:55c:cfe6:80c0 with SMTP id d75a77b69052e-55ccfe682cemr88301cf.26.1794626051752;
        Fri, 13 Nov 2026 19:14:11 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0f07afesm31826931cf.16.2026.11.13.19.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] firmware: raspberrypi: Add blank line after declaration in response_callback
Date: Fri, 13 Nov 2026 19:14:05 -0800
Message-ID: <20261114031405.870827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191414_558391_712B046E 
X-CRM114-Status: UNSURE (   8.27  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:31 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add a blank line after the local variable declaration.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

