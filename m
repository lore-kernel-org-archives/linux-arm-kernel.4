Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72F606A8B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLLu6fIu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5Leebox
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=; b=HLLu6fIuuG4Lr1
	WAqPV+TWFTwUbx0JepzTJG4/nuAHHdq4p4MepyvsWaI3NHouiJtrsQe4GROjeA1lcYMV/vMal/z8F
	10lZ9RzlNBhXAcIVKq7GCERkJfZRC+3jOEj0150IN0B9u6Y0I5fYwaxr6s0VymwbyIj1OrDzOUbLa
	pdQusSCzxZ4Y6z81gKTl904vOEC+WsWxkuBKlBV+9ThAw70OoWpOI7Jhg0ISgmR7sBsYGAjoXD5eb
	TL88LfwaK4eT8IKe9P1Br2yKCiPRjRMppM+1hQ91/1X3wcykkxQw+lSppP0t3t17BPNj8xi6MDhH5
	5rIlvXP236UCJa/PdsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr5V-0000000Cqjq-0DLv;
	Fri, 13 Nov 2026 13:13:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr5S-0000000CqhT-0EML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:13:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1599952a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575579; x=1795180379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=;
        b=L5Leeboxerfck2RcYo3aufINxLdm9tzQ0eJjXlY8bgpCbqw0AF7ki7rwxM6Ae4jLNz
         Sxs5zcGpz197GDFpvc+pUITI4+Xn3r0ayDi8Kwjt7510d8JejL2N6n+YDoe7YpG5U27O
         gxv5+hfnlzOkX4sXA1cLCS90KxogWdb9EKbEmT9woTRXhAv6wGT6pV+bAUAfe2KQWkOK
         8O9SguC7NJXMTvJY2M1YOuI/OzLAzCS+oVYTOSsuM85B8pvOVCynKxV902MreeQZaneK
         Q5UqdCq7GzVNMGUOFO+fJZh8Jx5CnzJlfA4CCHv97lZq4pxOBVL4EHxCF80RXLZ9sBFo
         DozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575579; x=1795180379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=;
        b=uqTGqSXieFrZDqECda4G1ICSNM/qo1VV7+t7yJ3W2XF8S+Gxq3rueGtavAAkTsYPM3
         X4/8i4DS5/D0lBzzD1NGEq6iLMglidz6EZ4KmqxgRdtsa3cDgTcJAe2omFm9wJzsqn1X
         /8Yul5mzmVeNIXxh0Y0rl7Ik5xcT/KD6mcoWEFlESTutpzXfz0Cd7QoonKIrHcBlPpTy
         ogVPzU0Ki3VuL+7HMHAvrXVSGtWyBYJbhJ/ctHwKcXl+gjJRWT/clwcF0/L5M1cRrWA6
         IwjGozseDt2R33dS1NcoTXo1UhX7BxR3vzi+k8f2yA/fNY4J2r1JnJygt2ns/f41hadV
         dYUA==
X-Forwarded-Encrypted: i=1; AL+hErGL0M4yBxLD6lESjpIV7OavuFXfm5BVdYdXqgZ7G6qgZuTfAqYTS4F0dHDwAv5zpGyjR3hmwDL97VEaLIpwMB1I@lists.infradead.org
X-Gm-Message-State: APuU4Z/nTIqUPMmTjkKFWJ/HnDqJxZQZw12CLqDvbRa/FgjdFKwIfUtz
	3HHz71s1p18LXnYkGrUqxYWqjUxNl3ZU4NLHUDOkQefQZIWw4+UAzf0N
X-Gm-Gg: AYBFou2B3Tsjd5Sw+7HatPclP3IU80d8CASFn2A15rPa9FGA0uoDciO2KFENIeNK25o
	bhPNJ/gHdioWbLUYNKnPTqobhuFBzsQSWnqKMEMn8qcMbWIA/wcXQRrcEmGVt5Q/8nCJjUtuz9g
	0yDa4m9SvtxN3BF+rF98TgH1G2wtDkfcu7XUPA5d25/Qu1tCB3JhJ3GGmCOJq+EMs8oCqFnWSFy
	QqkikdtaBDZIJDjK1mL5nFUg1oxvl2k+a31GM+14mvybmJbQlgpHRLuVS9wnyWMHffQySQJC8Lg
	F67xBzB/trDV55Scm+ovNX+Fwagha0E5N82Oe3BVWoKec1SOTkjnKtCTG0WNOMBk/s+2OWD4DUJ
	IXIyJffGEht2Jw9AXMFS5uiXnxPVuvIuZ0GVYikVZ7zcKMtiTH8dhdcr2RbxTJAOFdKMM/Y3PIL
	/r6SnQEbQqWL1c5x9ChqRueOvHj3HIX1cMHCaD41E2CwZka4rBJIrzLbbkyDH7EyZBo16caiKqR
	m3wQde4bwYCjwEIkhW4b0InPH7kQn/bILBDwNNPF7DiNOVr+COVBkO3ZChPQeQLZ6k1E2QTYl0h
	iQq9XuX/89785cipoqLn/YADEjq4SQXSCtyc/cw=
X-Received: by 2002:a17:90b:2642:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b1b0ba0a60mr1992696a91.27.1794575579407;
        Fri, 13 Nov 2026 05:12:59 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm4931622a91.11.2026.11.13.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:12:58 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: damon.ding@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Fri, 13 Nov 2026 21:12:48 +0800
Message-ID: <20261113131248.2804840-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
References: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051302_192363_B9613CF6 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Damon,

> You are right, this is really a valid concern.
>
> If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and
> keep the driver probing, while the new version would return an error
> directly.

-ENOSYS can only come from the !CONFIG_GENERIC_PHY stubs in
include/linux/phy/phy.h; the real implementation in drivers/phy/phy-core.c
never returns it. And the stub for the optional variant returns NULL, not
-ENOSYS:

    static inline struct phy *devm_phy_optional_get(struct device *dev,
                                                    const char *string)
    {
            return NULL;
    }

So with CONFIG_GENERIC_PHY disabled the PHY is still treated as absent
(NULL), exactly as the old -ENOSYS branch did. With CONFIG_GENERIC_PHY
enabled, -ENOSYS cannot occur, devm_phy_optional_get() turns -ENODEV into
NULL, and any other error is still propagated - same as the open-coded
check.

> It should be better to keep the -ENOSYS handling to preserve the
> original behavior.

Overall the behaviour is unchanged in both configurations, so no separate
handling is needed.

Best regards,
Jun Yan

