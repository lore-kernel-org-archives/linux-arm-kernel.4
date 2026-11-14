Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3svbag5;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ahqfL/r7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=; b=h3svbag5pMbA+3
	1NzNsTyhsrsDjQdqWUin+JuPmS+ErV8CnseKFCmuSNd/nfrehqYTnZy9l1xYkcyHKVyuCxnukC8/a
	D6d1DIjdfSCeLdwZcs0rqxKjrHFGOQICBfCHVqhus0VA7z6T/JYUT7Q9sdqRIF/cNgO7l8opKm+J5
	ROYVH6u9nhUlhy+ff0+Pjw+VmiuyT0rKzNJBfoNE9ClZc/C7WCtnjzDf/unwZ77NwwlmZt1lEkfnj
	LBm2m5xrW1XVokRSko8CmO50cGEWVIcNxwwrsIe1NGnlm0WyZXS1wfOrcMUYO9agZgUMAYVy5Vr7T
	oh7QMt6IZnDe1lit9WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Dy-0000000FDcy-0Yj8;
	Sat, 14 Nov 2026 03:14:42 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Du-0000000FDbY-2POK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:14:40 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1193501a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626078; x=1795230878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=;
        b=jw76rDgMdy/f4xqyTtKo9SI5q2urLGHioxzw6nmSChFw/usyf4Z/T7p7AzbdCbhZ3p
         brmx3r/UVdXIHh5AjtaFLlDO/c9TJHyWrIFtNkymU6HJuiMV4wvhEtF7Z9jAv7YueQyj
         inVOda1rBfe5ZEciXLNwYrf0oQMGptP77LOygXOibIVKPCRib/N7q9KdffEpCi3p9hq0
         DE162piAv0h4BizbMe24FMzicspLx8TRRQBAmd+XUac5p0K1Uk629DxtCYmJ4g8Q1aAU
         cDFU6+luJRNn1rlwPpzf6QuPNli6ov5G0nbZzIYIi3zHL1M4mcyqZT6GEdW5OQlS5+UW
         05Lw==
X-Forwarded-Encrypted: i=1; AL+hErEufDFftoW67DiYiww/KfRLZJW40TaczXm1vfi6vsTTdW7w0DzI5q55UooDWhKwRMjw+z8+ZvenTRM3IWZ2vfjW@lists.infradead.org
X-Gm-Message-State: APuU4Z8ykqzg5pL+xCKvEt6GL95YsuCd2z3PAlkCtdfFA9JtHCs0CjI0
	RKj1UfQbuzXl029z78mzUhkKj27NqDxz+c39cpaH4AObRXt5uIAdCXbzs9oqZTom2c4OXg77v/2
	6U9wUVzjcUYW+77JKblh0x7aNBAbSJbUBpcIC/Q+bkBb8S4choNU5G3oD5JQiWNhuUJJGB6snld
	0oGGsimM7CF/mcYg+hFhavbs0/SwnMaahO1+8cE3RE9LGX02P6RIlrC911GNANzZRswjMgqED6B
	PDpIbiB4p29APmmyby9MmVpnOOjsjsqx+4=
X-Gm-Gg: AYBFou11fknZ2Mu++jB/VXQ/ml69ro53HOoqY8DeEvm+qYVwGAMQoXzKXho6IACF8zo
	uhugebl7GZtebNmDjJhUp6ZotHdf7MMJAhOobR7W8ZTwu5xOr167KVptOuGdv7wczijjfPWlqU4
	OYlsrbVaZRd9Hc4kmYiAtATBxu+nb6y/DZXzemjJXsp/7AgflyXc415dkd4zJGksGb/PbaTHRyX
	yNUCNOV8ZBkR//2knz3Qpe6Zm87o+6UYtGaSUBSZw1PFvAbzUM2Gs5wTH9XzPRn7kKCNGjLuVlx
	LACtzOclYGJFkJItbSUoG3/W/ROH/FpUO2M+G3xz37OZq0oBcugPFcQq4ZvEacdi9mJLJ4/IDNN
	kEJqwRSs2ZC6TAh61//cBLxjTxbm2yBlUVNqZmDJSYCznzKyX92I9Yq+S1xSgXGweQQVZlWI003
	oXy+yBCAyoF1d7DUtxszPa9h9/Vgfzjy4rQN/5yH3S
X-Received: by 2002:a17:90b:55cf:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b1b0b5c1eamr3946499a91.58.1794626077832;
        Fri, 13 Nov 2026 19:14:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm8512580a91.1.2026.11.13.19.14.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5383d650f2dso31301361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626075; x=1795230875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=;
        b=ahqfL/r7L5hSTgZDqx6KM5Ii+SZ+2GyPUTf7s/OaCxbgZv+IFEpiT9zlKnIZ3B5V1c
         9FD7QQXXg18cT6D46rsJTdditdyH3CwGS7CuVG5E+oZBc9NnvwLbli/3nZVuMELih7RD
         l3Q+X3b2ap7PTJJ8vAORD2Bp5YTTrIR9wDAGo=
X-Forwarded-Encrypted: i=1; AL+hErHpUNhmjqxnsQw9YgL6hslTwUtDOpDtiG98pZ4j3cB0FfbJEAKTg8+jNbCUHw53XnZXvX8oMi3npT/40d9wt9nR@lists.infradead.org
X-Received: by 2002:a05:622a:a190:b0:55b:fb2e:a754 with SMTP id d75a77b69052e-55bfb2ea94fmr31383621cf.8.1794626075461;
        Fri, 13 Nov 2026 19:14:35 -0800 (PST)
X-Received: by 2002:a05:622a:a190:b0:55b:fb2e:a754 with SMTP id d75a77b69052e-55bfb2ea94fmr31383341cf.8.1794626075036;
        Fri, 13 Nov 2026 19:14:35 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2028dsm31415831cf.11.2026.11.13.19.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:34 -0800 (PST)
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
Subject: Re: [PATCH v2 3/6] firmware: raspberrypi: Add blank line after declaration in probe error path
Date: Fri, 13 Nov 2026 19:14:32 -0800
Message-ID: <20261114031432.871022-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191438_609046_7FC10CC2 
X-CRM114-Status: UNSURE (   8.24  )
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

On Sat, 07 Nov 2026 19:21:33 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add the conventional blank line after the local variable declaration.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

