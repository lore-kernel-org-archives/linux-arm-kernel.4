Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F630606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gNzOAhyK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOO8oDcJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=; b=gNzOAhyKZcfokt
	GQfQC7JbZvazJ3jhONT9oEYv6KKTQTkCQQR71Pqwab3dX00ilgUeM+Ra67gsrQ7aWCSCMpM9kvM59
	i5zFrgat7lGHnwTZosQNB1wjUqh7zQ5DNSdyC8osAbc35mIyeUiuISWfYqQBKQQ8UIG2XIJ4tmoj1
	P4TXxyElhaXW2TIQi/i6H+lZgUKsQohaFtVbLJNPNgGb3G+4zh6iS/lLEmIvB5rUew0PLrZhGKbhK
	X4qHpbH8eS6Eg+G8YjFb4Z2QuJCT8YSPJaBJA+6F9ZxCGwi2pNMe+VjXUQUxI14ZnUqoGOR0zTfGp
	GprpnM5l+x23bn+soPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFNX-0000000GLfo-1mvz;
	Sat, 14 Nov 2026 15:09:19 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSFNU-0000000GLf5-49jJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 15:09:18 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-372bdb942dbso2091133eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 07:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794668956; x=1795273756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=;
        b=bOO8oDcJO3SApUANfeOnXK0iCWqugFSjO026iiCCkucUqzrMJUBBiJAKJ5nLHoe84p
         vCPEbyiLJ5CEPsL4CMp/1zGUXRfarEMBmuAvx53uRwVFa/rdUTWyz+G08VNMMZMZ0MTl
         N7x+h/d28F5dkbT7WKfkmDm2ljUsaoAHVqfJ0O73PhbVIUtDkKX8eVmPX5MSY6JY3cxt
         m8nW/QLMfaV4JozqyJ5EKhzxrhJYln0SAzz28a6DonBUVDRktYfyv212DTZV3CIUKaak
         Lq7SEJ2TpiZ0eGJNx9lOiMtA5YqfozoDDA9Z+yf7mw4IhojXLYwUpCbpwmo7H6odsYJj
         rk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668956; x=1795273756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIozortPxX9/yGgYF5RVAdU5h+CP6K/5KZOyPsSClnQ=;
        b=e/+BIcrfhT/uhcwHv/LfzhMnWnS/gy/u6hkFiSaYXlJtl9+Ax7/N58HoY+oGgvr8BC
         SgPL6tVqyNHmEGts+158tVntjBnNBqSH9CS83BpdH0bV1S9Vd/QXqLv7wjLqHxMeqPC1
         YaboqJPY9fJNNehZ5B9Jtf8LdYvT0QZ4pP4uIjeUcW2opZRcO7Mw5mB+8MI47A8S2heM
         QDGa30yCYn6QiM+ajI1e+7qVnf5Lt4HjePgQ1LII7RMfIqKlHEXDxFA9Dwdb5jLPkCVy
         k5ue4E9mp6iZ1dagmLpP4kU0Lj1VzoLutUigFZen9HVkJeOcYH56jN9bVPF3AC01fyUh
         OuFw==
X-Forwarded-Encrypted: i=1; AL+hErFxFhaQd2P4iLnnvJJIsQI2s+LF28BD+vJZgnysWK6J7xF9w9h9itS1niWdgMEcfYFolSFblM5t0X/IoY9EMF1H@lists.infradead.org
X-Gm-Message-State: APuU4Z/TyAyhnfpPQ1zJBOI9Gni3IMu130fPCk4hTcDeICPZh08rzZhR
	OCDkjFwsErXbD76KQR2bzA52ebCBaRXayfUfcmTn3oqur2/8n8p8ml/Q
X-Gm-Gg: AYBFou2qt6t5Ppxm46lpP+L/h/eJ7UUexa3cy+UbA9K/xpOqNs7U1hOLEuW9wXPfNlf
	gHafnu7ICVlFdN9bdhm5MqmvRCM+bi7QnjUO3z+vMG6nPp3kBwXMNWjSHCYVgQU90EUfJa31zde
	FVRE7+KZoE4PVJsHTPIHRpjTdY6CoUhSysnr/LhvC61XXkS14XMA5j0+bwZWVt5SnDAPbwewmzX
	bBIHb9mQaCkLVl3B6idQcphTYz7eeY7IXPwpnsRmqI9xqJuFpqiiVCvFOWco59v2c/Kohv1Znbz
	fsEU5pPV1SbIGkdq3zs2YNOEF3RzNQK9NOX0ARC+btONv8YRGGdF/meYn9CA0lR7KqNIftSrmh/
	5LBAzV+PjKYg1rEk/h3gObz0LETweqtabg2vxPCIb+te5IBRUwjFh/zM83hwAKr08AsIEc/8m+t
	eTXVX4lXcL/emoXsq0VaTdl/rXbQugE9+bIaIoI5UN+5SfzddiT4Bz+Kx2EFxtRTYSpOTMkCryi
	3xN3uZW11DHxneLMug09QUk53J1MKGsGrv0UtS/5EODb3NA/uJMzjXHSBv5n5P7BiRbi2r5WIH5
	BCADuSTZL1Bh1KvUxglcafRD1Q==
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr5561636eec.25.1794668955716;
        Sat, 14 Nov 2026 07:09:15 -0800 (PST)
Received: from arch.localdomain ([2409:8a2b:a08:f11::1003])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm30427886eec.21.2026.11.14.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:09:15 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	damon.ding@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sat, 14 Nov 2026 23:09:07 +0800
Message-ID: <20261114150907.305160-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DMU749TMB523.3OCGPYVI4NZDU@bootlin.com>
References: <DMU749TMB523.3OCGPYVI4NZDU@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_070917_030045_2B52C7ED 
X-CRM114-Status: GOOD (  24.25  )
X-Spam-Score: -1.9 (-)
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

Hi Luca,

> Hello,
> 
> On Fri Nov 13, 2026 at 2:12 PM CET, Jun Yan wrote:
> > Hi Damon,
> >
> >> You are right, this is really a valid concern.
> >>
> >> If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and
> >> keep the driver probing, while the new version would return an error
> >> directly.
> >
> > -ENOSYS can only come from the !CONFIG_GENERIC_PHY stubs in
> > include/linux/phy/phy.h; the real implementation in drivers/phy/phy-core.=
> c
> > never returns it. And the stub for the optional variant returns NULL, not
> > -ENOSYS:
> >
> >     static inline struct phy *devm_phy_optional_get(struct device *dev,
> >                                                     const char *string)
> >     {
> >             return NULL;
> >     }
> >
> > So with CONFIG_GENERIC_PHY disabled the PHY is still treated as absent
> > (NULL), exactly as the old -ENOSYS branch did. With CONFIG_GENERIC_PHY
> > enabled, -ENOSYS cannot occur, devm_phy_optional_get() turns -ENODEV into
> > NULL, and any other error is still propagated - same as the open-coded
> > check.
> >
> >> It should be better to keep the -ENOSYS handling to preserve the
> >> original behavior.
> >
> > Overall the behaviour is unchanged in both configurations, so no separate
> > handling is needed.
> 
> Thanks for the analysis! Cna you send a v4 with that explained in the
> commit message, possibly in a more concise way, maybe with bullets for the
> various CONFIG_GENERIC_PHY on/off cases or so, for readability?
> 

Yes, I'll send a v4.

> Reading it now, this v3 commit message kind of said the same things. but it
> misled both me and Damon, so it's worth a clear explanation.
> 
> Thanks!
> 
> Luca

Thanks,
Jun


