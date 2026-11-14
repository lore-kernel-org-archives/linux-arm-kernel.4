Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD3606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umuqtX70;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KYdDjkPa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=; b=umuqtX70zIOmle
	9Lt6RlPxvVj9CuR+zjERgYsLI/vk3KNg9TmEK+RPg+D+pIySS7wvQtZSTRucaWs55odDJXHo+g6aN
	vTybGKNKiQ887kq7mRDtCNsxrdcHhBPvgMn6VWa12BFFwzY+vAw3Tg7kUCs32J9YLyc/tf+PJuFIJ
	qCJpZ8TOG4a3VB6mVrYjw1amd8CE2W2yHozLtaHBJ7rwANIgCNnzt2dBFF/04alymOlnDFKHN+3ZW
	ZqsvNXI+AwFLcAvntx45rLNwAvH5s0dwFtkfwL8dnPNy1T3tg5QETGh0w/YP4LsrqHG50Yic3uCA0
	1tMiePJJ7sguLX5SUW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4PH-0000000FFOh-44ce;
	Sat, 14 Nov 2026 03:26:23 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4PF-0000000FFMm-050s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:26:22 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso619698a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626780; x=1795231580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=Dz5VzqDe4su7ZLq/juPQzqRkGhAQVk8nieyol6r9bqNq+2hTxLY+1UoMJI8QBYbDSs
         +TnbKXExO5Lq8H4CWVoJYpKOgMIbAbI8AyNln/zU5dMbuyYjPT4kz4OwHmg4qE5WOSDY
         HA0IcVxdJ1d5i/eCmpQpJB9IGZDjndtAqsn0H5lrIVOoOAn0v3xcuumRP5KlRYkNQpHQ
         MxaQbpVz4CdnkkCxlEtZd6c4swwbkslKoPZQyfqWLnCA6RozSl4lpiTKA4t7MIIy2ps1
         /+6+wpVH8Cwz0GtNVu12stzBBk4utyQh1whUvoHZgybwf8sr1aGT6JBbSyBqM9bhvOAz
         x5bA==
X-Forwarded-Encrypted: i=1; AL+hErEup4UvU3XwnNNopefL+BAosx6FGpxC8XfkohtztNfST5WvTOD9tXPXKq6xxJjD+vq+SV7oUYADhdcZWSygNKZy@lists.infradead.org
X-Gm-Message-State: APuU4Z/2OliISMoxAZsNRfIG0GngfskWglxSjza2QtPGJmK3p/nzvJjG
	7Gq2ihd+WCcw33gK0zo0k+Sxrb0yTeQD0M0GpxecnaEbIydUANL4GYij/TO3llqZuFYtt5w2QpW
	Ruy8uZ9cezdUvAiWgls8tH+lSRM0IiEw1xHYrygLlHTTKaKD0kU8k6Qah1pZDSJOOyFE50ZxOWj
	oS3A7RvoPdjt0uvFW30EuQmYlviOEcfJG25GsTpEUTmzmcRfw6CHCqtJ0L04icyeV9TBubwgQUe
	8gvPI4mdwS3gKehEe5Z9husUKa1X0QlEdY=
X-Gm-Gg: AYBFou2f3niADXsHPTBaWlk9yw1o/2a5vRn+UtovVuGVEt8axky4xTSMJHAXZpY1DEj
	L3XurAbAI5hUPy43VZ+a5kJS9FhwTSFac/2zMFxTCPZIu56PRE6swh6YehhiUZfpYKGYqZCfym8
	YSbsU9hEPlXtWxxwdHzDm0qCMylN9xJgku6VW9XVrHdoaL2DN0VRmttVJL+3nP4dnQWfgK6Y2Ur
	1k0Ltl1ViQqjzYaQIqgrIA97qdG/kC0XLCOcg8N8mbj9oH4R7swNOszwK87u1s9nWOSRVd8OUga
	cbrNZfu7hYPMetfjRjnt53on4ouniw1vuRMsMi+uUSoYWOkxHKFDRMgXOoxsaRezhiYywNx9qf5
	aSkz4GqV9uid5RBH0OktwHFJdhkV3Ah78q1n23hCczAuEAU73yGrbXd5tDuoygXHk6EFb3R8lD7
	Za3X1ejYMDMqnSKbTJMSmxCUwEgrRUyTvhs0ds21/s
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr4572213a91.55.1794626780286;
        Fri, 13 Nov 2026 19:26:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm6667942a91.5.2026.11.13.19.26.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070474eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626777; x=1795231577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=KYdDjkPaD71bd7Ke+Jlvr/1XjSf8NEiZkKp0RrBV5fWojVi2HPEDPQwT5vacTdLvuS
         /CCZkNyy6w+YkySqenShDwufnSjZKRvDbXda3NtFGEDij0IZ6P1RXy5OGoJmpMaBJD7b
         JRkggzQph4U3gUc4UAlS6WtZg3WZW0WH0/feg=
X-Forwarded-Encrypted: i=1; AL+hErHrfCRodky1MwzJn3fWZp/uIPCdlJ+NA7P0N3ZiAlWzGrbO+iHY74ARABUiA/x7770J8D0avOAi9g7Y2Maig6AC@lists.infradead.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626100eec.21.1794626777529;
        Fri, 13 Nov 2026 19:26:17 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626066eec.21.1794626776854;
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm11863608eec.0.2026.11.13.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 08/11] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
Date: Fri, 13 Nov 2026 19:26:14 -0800
Message-ID: <20261114032614.873772-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192621_055873_25D00046 
X-CRM114-Status: GOOD (  10.34  )
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

On Thu, 12 Nov 2026 16:48:06 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Now that VCHIQ interface is destaged, different drivers (like ISP or
> codec) no longer live under the same tree as VCHIQ-MMAL, but in their
> relevant trees like media or audio.
> 
> Enable access to the MMAL headers for such drivers by moving them under
> include/linux/raspberrypi with other VCHIQ headers.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

