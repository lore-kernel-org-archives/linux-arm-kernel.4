Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23060606A895
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wl/4vgdu;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Nbjbj083
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=; b=Wl/4vgduNbws4H
	gwoUoQUaoFo7JN/vO2jtGFe7RBBCLBPLU3AC5Kx6lalkL05uAShHK4MJM47hjVFrweRlPCpYdYC/+
	zZ27Y6+wqvOg3CotsmnWLXqd//HiXrftOAACcjn1i3my6YqUKPNAT5PP5yOYEJwRipQYJ5Ts3g2kq
	jwYoIppImgPxCPrD4ck1Klwu+6gXp7GiZsb46IinBGh1u4cu6UF5/d9ZcVWAUSewzVHjk1elYDkno
	h/F70AywwtMSRoybvQ1FBG+khbBoeevCRiF4csz++ScvLpY4yG8Bao4JhcGMvEIJo2jcSFxpm6vtG
	C7ivtyRXdnf3aeQuvFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5i0-000000045s1-0OHQ;
	Mon, 16 Nov 2026 23:01:56 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hq-000000045o6-1r2r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:01:47 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso200135a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870106; x=1795474906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=;
        b=m/vkfsq4Qb7IvZ+sBCZ9XoKwLlnUYtKpyqGC9VeY9VWCZ1cKE1XrWsoJWGS/1xnBkR
         jkZ40j1OqWiRsu9RfqlMBw97TdBEBxBrNEIDqcw0aMD91iWfOHeFdj9PlVcq4a9c1y5K
         4UgD/WWdtargd2FHCxWW0a0U2wFjzoBLBrTvNYkSLyonBmpz8Ewy3w/fHQlhA53h1TTl
         efRSTbA68+BKj9Vf56bvOqQCXl+vF02xB1LvW+LaDUEolH11yqwfafpMugbN+i/D0wC/
         GJGC8CS3sSRbMQm01cIUBL4IcenlIw264J7r3AGAiRoOdMKTPO145owIYWqzz6uHdpYN
         TZYQ==
X-Forwarded-Encrypted: i=1; AL+hErGEcdq5H8DkoMtIn25SqIxvQXj67d47oChASOr6en1HO1tgtvXnJMLrlCnnoGZVLeMm67+21aUOQJgtbEJlgl8V@lists.infradead.org
X-Gm-Message-State: APuU4Z+cOGN0GFXFqnEHFkU9ZmfPhFX0SqXzUiUvtr3FWfQ/hA02BYJ8
	9EoA8+ctfL2C55RHhbEfb6CfK/2wH81jwmdYxUdIdKmv+vQiLvWUZ49vGNXXeqLAZzhhS5qn4nz
	lMRUM76XnBYt4liG4EPC6xcNjKayuGA6SDOOeaBSNiO6Z3oyLYZgbcUEeoI+M1zVIadi30YY4Xb
	O/Vtb0tiunG5AreqeI2sIb3rHzB8FjGeLksUNxwVYC6j6obovB65UEw6Yz06FJZGcKLs3BFKGj3
	oBOmoprmJD31UB8JBeJkly/ufzuk3/xCsQ=
X-Gm-Gg: AZFdTZdRx1mF/yyzr7G34RGLFz3DtXv3wug7mhXrf8L784n+xRV7SyAn0mmZqUJsKAd
	lx403byyYxWbZzamiE5oC6+fLo62hVOCRA+yM4j3qduAZVRoQw5xshyNttA2daa2LZxCQHVklBp
	SrkMqM5syKwVAPhQ3MOLTSb561GOKj5LqIvZLfK+yajwOc89+qZWPqfhAPs94X3vSrwa6bersK5
	+szkeEErM5VelsmRBrB1njL3uaRk3zVIMfka8Ss0YbPVl8IOoKVS+vsWDDKUf4LQcfB5ywz3yzo
	c61NLse3G2TD4LnHjzIZexUFP3jPrBbH5R/QPo6rz7vqq2PGZvL1kpWi9RyOe1v/8dEhqPclKXD
	j3Pir0/k7aMAn3YNS5QN3ASQOVPjYprSe65Jl2R8+vDtrjK5SG79O1HYs9ryfHgqmhTNzVrk29N
	9fMYnOKkcnG7gSrbZwLO0wBS56gXNwIuvR83LRPBj3
X-Received: by 2002:a17:90a:bc94:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b3ab970facmr377848a91.0.1794870105608;
        Mon, 16 Nov 2026 15:01:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3fbf607sm5343935a91.4.2026.11.16.15.01.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3afcaadeeso65582c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870104; x=1795474904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=;
        b=Nbjbj0839AUERpbGkrniMXvFSEuejudaVFB0O08PKc1xEjy5Aw+lpQcHxN2Dk+72w1
         aMDkiMDnsqw/L9UVa73dVxrAUWl5gfVUISagdp/se0UxuhA+GzYjn5Fl1sOJ4E4t2aEi
         fJh/qoT4HuWw34hw7bOQmOusMCDnDm8T5zkU0=
X-Forwarded-Encrypted: i=1; AL+hErGxoqXUEtj4vcTEW5zCvEmtV+w0egrO0DgwnJypxs7B83FdUkWqfg2MjJ1gKiJ3VnWcV75Nd6OtB2Bbv5VMtxe0@lists.infradead.org
X-Received: by 2002:a05:701b:4590:10b0:145:ac96:3917 with SMTP id a92af1059eb24-1b53a470bffmr663527c88.21.1794870103519;
        Mon, 16 Nov 2026 15:01:43 -0800 (PST)
X-Received: by 2002:a05:701b:4590:10b0:145:ac96:3917 with SMTP id a92af1059eb24-1b53a470bffmr663482c88.21.1794870102473;
        Mon, 16 Nov 2026 15:01:42 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm35174833c88.6.2026.11.16.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:01:41 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] platform/raspberrypi: vchiq-mmal: Fix warnings in the zero-copy path
Date: Mon, 16 Nov 2026 15:01:39 -0800
Message-ID: <20261116230139.1470752-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com> <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150146_510243_C4EF754E 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, 16 Nov 2026 19:02:54 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Fix minor issues reported by sparse and smatch around the zero-copy
> support added in mmal-vchiq.
> 
> If there is no handle present vc_sm_cma_get_vc_handle() might fail,
> which we check but end up printing and returing the value of the
> undefined `ret` variable. Fix it by returning -EINVAL and dropping `ret`
> from the print.
> 
> While at it, also fix the stale reference to the function name
> "vc_sm_int_handle" in the error print, which was renamed to
> "vc_sm_cma_get_vc_handle".
> 
> Secondly, during cleanup assign NULL instead of 0 to buf->vcsm_handle,
> which is a pointer.
> 
> Fixes: 67d0fbe47f8a ("platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141210.9hmxzD2V-lkp@intel.com/
> Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

