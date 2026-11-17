Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D9D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rVwQtwWs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMhnPwUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=; b=rVwQtwWs+xwd4VvC5+9GKP3CnC
	+gvg55tmrH37mw0N5OwXrLV9DtZ5fPwMJ6V1gxGZC2658iALecR7gQpuKS+OoyUzPEXrQjvFA+MCs
	zbYNRnNvZ5Uj3YaSKMMQldipgUJwWdzKmFwRcZZDABoMYZOgVOmLouUkN2vR4QbxqDG2YNFlI3hLt
	gScxFclJRpKMeLrQbFi1/XWLvyiNFD4vpgV9S2BfpDBp4imYmjkJp80vaIkJ3f+K32sCNa+fpCiZt
	KKUxfKRA1BkzDbwBcmJpIRhHP39Owys2NQvEpxOngDu2CAcQmlg9wJ9FjpM30UmFhrienZXxPCppV
	wYGNTV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN6B-00000006bRC-3lm3;
	Tue, 17 Nov 2026 17:36:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5S-00000006asD-0TLu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:35:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ea63087d6eso3391395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936917; cv=none;
        d=google.com; s=arc-20260327;
        b=e/69aYwJ5J/zuS88di9vi5NWvbmkTXSXmBrV5dDHbtIvMJMUnCN7HGMTwYQcdqQgc1
         YcAIy35bU41Xk+Oho2kCrXONqHUWSTra4h/cx0uvF9GWks605nafed5ThlbKhtqQRiWG
         nbXQJZ7mlfVKToeRaZsPO8sDDGyrD/EIolfOjpWEbfy+51Hk3Lvzy+I1n01b08uzLa6+
         9HfvWQkHpx7rO+fEKvTbQNjNqxEvB9Fm49TRTtpROlHLIO6LkcWoJLg47IrM6TBizFQ0
         CMT8Y8qM6EQDZ0BiCXKWJL93dnVNYYIiq3zA6jSZo9jfU8eIq/sY4fCfxsUEYOB0ofj4
         9YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        fh=qSBVzo89Y6TVYWnyficj3L+vEcNfL19QQchCk8vh9VA=;
        b=I2mFx96uwviMwdhx7nIUTn2LaO97etApfA9NWZEft4d2CRXXzNZDSAZRKJUiPFz7Kc
         gJ/rSXHfrGVW1OnoiLhkzRLFW+FJss/8Gq6Jqzdyd3KaVY+WXRNUammh8qj6SluP1/8B
         1ipvdyqYmEUfDypRe4TDLyjVyN6G5ZrzVwwXmyAT3Vi8DfX8ti3xWLHwmYyrvGRYTps2
         QUj9qGKW5bMf/oHrPSlUegzWljzs+oN67Z7ODEbqDvTwOXgsJBROtvZQAJZP/5ZJdH26
         bmXFYXbHiM2FOx9Rcz5IyaCRauvCxtjDj1XjWY1mIT+337jjRX5sym91x5b6Pe7cxyAd
         Sedg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936917; x=1795541717; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=jMhnPwUsUlRkdzcwk/1fJCXNP2YPHG3DcHadQFN77iS4J3ra1fNyq5nEXzp86FhsTG
         YuR6fyrI5k9PJZE3n2x6M0NjeI2r+GayEhwZWR2w0D/iTKSW4xPd18VEsmENN97IkN56
         3zX8rDHWW+YqwwjOVHnsGi3wTbvAOfZdLDWihfgvECo9YNVqyeddqvComk8BInhLoJzS
         BoE9HYw7scrytht34Tvbp80fW1R3O3UcruHmccmukHKtHD81NZYprCCoWsY6EZUwp9KX
         CJiODAr2vU/Q17f2IEtRc6onlm+YyGBK6Rp777ckH6F6+K/yubFbQ+/cTY/5U+1QHWDJ
         myQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936917; x=1795541717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=e4WrDDtKXVDhU9umBZtiR3YAfA8TCpjpRh3oQ9CjLHapkFwBC4hYqqOyyrhz/agZ2i
         +ivX/hzfmt5TbWYFxQLS5S+pQTtPa4UvX0PjxsGB/8liY5B7wmn39oX4dPzgQofgRqmt
         +WQUAeeS9Mg+64KVjc1uFxMNRy30zDsHvJwX4t6PhJW/VAZd4OTUdlsSMwSLwzqdaBNS
         ClbKGxuQrBa0TQtquETGxAqoxL30emD2PuEfRK4Vs90wePD3Ha+XsKotPKGhengGGXgy
         EbnONXICapP+OXCxJocnTDEK+tSe3s0EVi0aFndfS4CmaJDcCf5jrIbaMcTwo7zfr30a
         5BZg==
X-Forwarded-Encrypted: i=1; AL+hErE2cIa6bNaOQOM1aPEW/OJgXBZLXBDMcDdmj0l2FISpV+PO08znANqOLPogKnTfaKacfynD0rMxVbOcv47feP7b@lists.infradead.org
X-Gm-Message-State: APuU4Z8Lqs7Ja7zNR/FBFV4Jn2RK0nQaQwxl3eqfGcJoEvXkI9lAp5/m
	zv55d1+q7vZDiGoRZ4EwxnQEVFjNzwbPlq43nhoCnlHXvyq6JpUrLhGc6bvFaZAtFd62CJjnh1C
	YcDFCfTHRTtiXZXKZGl3S/++PpQNACik=
X-Gm-Gg: AZFdTZd7LUSBCZv1QivXz8mUC9n2ktO4AzpYh6gn5r4MiZXKg35nIoZDiCy7Riey7TH
	MyZf+nt8bHNUS437M/OFe9hqBHRTegCHmwegtYHpN9UZheQMUvGceZVxXLChCrBhRebrmElAXep
	CfMsxlUMGt/TtgTJ9ZnaevCbYOTCx3o0XDCocXqcT1sCqbh4OzTHCmN/QeanxXV2kZE57F7Rx+x
	2bQzrj4MRfyspJtSrNRIwameVaZUTczHapCMUxse/nYFqNBZqHu3FXhZhEsEhG14gXHI1rNjC0Z
	MHsi0pjrUQ8sKnQ6iyrenJBrARfCyMdNc9R/n70ObJ8Ry/MMZFbQ2ea5pTwgXsMfqDfK3JI+rfm
	MAl8mu5jcbJvkaPPA4Dn7q7m2dnSLISc24yVOEw==
X-Received: by 2002:a17:903:41ca:b0:2df:8ab7:fe3a with SMTP id
 d9443c01a7336-2eff751fc0cmr213765ad.4.1794936916611; Tue, 17 Nov 2026
 09:35:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com> <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto> <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
In-Reply-To: <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 18 Nov 2026 01:35:04 +0800
X-Gm-Features: AclHuK-3dP_RVRp9S7UU3KZcH-t0O4kwljf1AMinJpV8gpEOTdKcRjWE-9zLE7Q
Message-ID: <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	philip.radford@arm.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093518_157885_20C12017 
X-CRM114-Status: UNSURE (   8.76  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I think the current v2 may have reintroduced the second deadlock
described in my original commit message.

scmi_forceful_work_func() still calls unregister_reboot_notifier()
while holding sc->state_mtx. Could you also check the potential lock
inversion between state_mtx and reboot_notifier_list.rwsem?

The reboot path holds the rwsem read lock while executing the notifier
callback, which then waits for state_mtx. Meanwhile, the worker holds
state_mtx while trying to unregister the notifier, which requires the
rwsem write lock.

Thanks,
Chengyu

