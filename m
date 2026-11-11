Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092D606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tw6/dPbk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VAGhl3nj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=; b=Tw6/dPbkY7IGWp
	nNBYmQ8VJtFrpHwe0vpOAGYFxIEswGqs4VTu/qkUxuThgz7kNXw9T8zx7qEvlb+fkNcH5vh0cqegJ
	hpVYJuGcji5TWQwWLa0l739kKUvLlqhnnXjcc8vIhoNUt/gjXQfh0A26Zpn+nviiMQVjmJEim9Qe7
	jZ+puT6z6Foef8vRzJ0w2xdaLN6IAZXRdCkKVTDnjOK5/GGLdG11KJmwN6SVh7+oGnWbl2MdxYY6F
	hZ63d6X3qYf/h7e9+aPNOdfygKFMscDS9Iz9LC6MFHJGCk0sqQvjyDWAzKR1jVyqh15gKASOc8B8B
	PzcvwA86uy0bhN/GownQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR80m-00000006lrY-05Sp;
	Wed, 11 Nov 2026 13:05:12 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR80j-00000006lqp-2rFe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:05:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cddac941ed1so63476a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402309; x=1795007109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=VAGhl3nj0isb/1diJtHEIn0ikkjXNvo7aT7PpKRsW6VoBptHRFjTuQd4z0oefNJItS
         jXob1of6uGSQ1wIRGQrGBMqemC/0dNmOgBSJurNgM1jN/eMXr2MEEv1ffn2q9J4aUmfK
         Avym5PQGJ12/+gfsReO05pM+jgeXukPvu69nHy0/8eyfEK2dlZiagOGL+qg5GsWRr0Na
         7A8DchH74NVrQmhHh1PkDEyffIFr7qqls4Bjsir9Bycf+n+f2Jwvwx/h8PDYjtNG26ns
         5DK+HIFqB0bdgrZfeV5tTGr4RoCn4v/PGWKnUVnPnPew5LCTV3T8oPXO/nZgy+4f6VPF
         PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402309; x=1795007109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=Mwf2J3cOjyy3/XPhwrn0toMI+41xD1P/xgy084PZLJJXV/WDJcGc2ZfUK1clCYDEUZ
         EsHumm/ZeuM8+dnP6re9F3WE6dfaDNG9ggskomMUzafs5ZwVBFu1PGkdPhAutxgMW6k0
         94oTrgZh3I546/Ti1ipiYNremRwuuEY/OG74N68N0Af/fzsp1DMW/O4++hGmA9XGNkBq
         nsWRTYarhxSL7c2fON0jEFPfi7pKcpUes0u6FyhEDPvtXLKq/cQ885W9W6kIrxn/nxJ9
         pC/6lOFfvz7YDdvIS4vKmT9WTDy6h3PK/DIExqPBJ3vGq7wV7UnmpjgwWLZiKbzVSb2s
         6PNw==
X-Forwarded-Encrypted: i=1; AL+hErGcxEy0saVNbbcwmQYQtMqzCL56rtYeJ089UYMJQ6YJs8MQ76GgATZxsdgyts8AwRPqTiWaJ2xkN70L8evcfe8m@lists.infradead.org
X-Gm-Message-State: APuU4Z/VKJu7p5y5hsVo0mRrlss5nRdcvoPuobuzW/pXizNPeZdhKiJ5
	nxuvJvuVXlNqXvU6KqAe9+sdnBRHy+Ztk/+XtyN93vc/W77L2ufJPlx4
X-Gm-Gg: AYBFou2WVnNetcpTbJpW965JXwJd1YCOGjOGIQzxbFR7Md1fUbbl3YP3nLPfDe/3aCi
	d342YH+IJ0R56X0zeUVEE/Jz0KJHaeF1shS7ohnc1H0e/FCzFoSk1hHs3tMJK+5CYV/KnqARzOw
	lsh3EybkptwgscbqdAqMwgdEcXwRvuRJ2Jo5GZ6DCEfUteMo0W/Fslf3g+8HwLy3eWujZe6V5nw
	Q69RS5Jak/bcVtvovGVG6z1pyp5yM28Xycyk6MtSlkv/wOCfZCoCxfLnJJ2oDn5IFIVhDwaXdlB
	b2EqVS3TaX91RplmUlhp5kdfGbE02B+oyzrKitI18rV+dA9D52N0RoX2kc+/9oZclvxR+qzxH4m
	EeFPPGrnY+ZDf3AwDhqacLCMhmEA0OayXTgFXvLj6buAMfFkf2YBk3dVHNgjMSrQw1J5zmuB+o7
	sQYkkzrEvcJwtG2iXFSl6Mtcp03/RFuzqtmUMreni7vTOFdFIPdG3dPRHD6J+X2OjOQVO9iAEE4
	1BmbJM8bklb5zk9ajg/fFtHz/EhuVErcPkkNf4xx2RohId06zPY8In9y0gzO6EVRddqQ/5QQatj
	V99R/t6gjpdFoAqWdo39WpieTKhrS993RmNhn6T0at0ntAKiKxaPYnE=
X-Received: by 2002:a17:90b:1c02:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b182eabbd9mr2501115a91.22.1794402308782;
        Wed, 11 Nov 2026 05:05:08 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7fc2dsm4448216a91.13.2026.11.11.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:07 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Wed, 11 Nov 2026 21:04:57 +0800
Message-Id: <20261111130457.4143667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com> <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050509_721048_E7251CB9 
X-CRM114-Status: UNSURE (   6.95  )
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

Hi Yin,

Happy to share more details.

1. Our SoC is an automotive-grade platform with an MPAM 1.1
compliant MSC on the DDR egress path for system-wide
bandwidth QoS.

2. The typical scenario is preventing memory-bandwidth-sensitive
workloads from saturating DDR: isolating bandwidth between
infotainment and ADAS domains, and preventing background
services from starving latency-critical workloads.

3. We verified on v5 (with the top-level memory controller MSC
node as a direct child of the root):
   - MSC probe from DT (dmesg: MPAM enabled)
   - resctrl mount with L3/MB/L3_MON resources
   - MB allocation through schemata writes
   - Dynamic throttle change while traffic is running
   - MBWU monitoring (mbm_total_bytes)
   - Monitor assignment across multiple groups

Usage log showing the memory controller MSC working through
resctrl on our board:

    root@hobot:~# mkdir /sys/fs/resctrl/group1
    root@hobot:~# echo "MB:0=50" > /sys/fs/resctrl/group1/schemata
    root@hobot:~# cat /sys/fs/resctrl/group1/schemata
        MB:0=50
        L3:0=ff

    root@hobot:~# my_app &
    root@hobot:~# echo $! > /sys/fs/resctrl/group1/tasks
    root@hobot:~# cat /sys/fs/resctrl/group1/mon_data/mon_L3_00/mbm_total_bytes
    1314

    # Dynamic throttle change while workload is running:
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff
    root@hobot:~# echo "MB:0=20" > /sys/fs/resctrl/schemata
    root@hobot:~# echo "MB:0=100" > /sys/fs/resctrl/schemata
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff

The bandwidth throttling takes effect immediately on schemata
writes - verified by observing the DDR bandwidth counter drop
and recover in sync with the throttle level changes.

Thanks,
Ping

