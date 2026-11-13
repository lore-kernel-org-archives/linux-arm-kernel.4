Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7570606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKxZLYwD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DX0opxKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=; b=XKxZLYwDTEaPAg
	NI4ELJDjqoQ5Ha/XdDjU3HyiMhpF6QebxqA6DnCEe6X+YlvlEz3FxQttxH1c/WX2Vh7qTQcZ8nGvK
	Eix29mN7cHC4IX/SyOrDBhoainT0RREJg1of5+V9xUsRNmFV67kwuZKYyKXnTYf5l5phP5Oy5YlR8
	6sYN7W8UtU2d6WB4ptqQ//sx6s6gshG6/fn3okEhw1AU3enqPOh2+cJXoLEItumR5u/s3rvxKv9BO
	wY3FXZNv0DffNRkjhHM7kBYaTxv2OGnm/bB7akGudDA7kD/UF+sYFJtPFks7itwh3KEv1VB/TqFrP
	2qqltNrFFfJfwQ1sBKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHN-0000000BKzu-3v9J;
	Fri, 13 Nov 2026 00:36:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHF-0000000BKvO-0oVI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-497614c95f0so155346f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530183; x=1795134983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=;
        b=DX0opxKEj0e11vitfAXR6d3Wp0W8NonXzSyL65zD84IZuvS1hDX+v1l5x7a7gwPsn9
         FModL3IFkdl9qoNkIXBhla6jlWqVILENXJvBwBgAvHrMg3M83ZFLbKUHMWaW3BK+M56W
         uS8WYtfn2A7t8RmqInKY1/4o7IdvNyHU0nNL1Sw6Fr9jE1VHE76qEwkoIT1oj83aLGFf
         at37Epl91+Rw268qNUW3bF8Gi0uNEkgyVVZvFdlHrhVOpWducJ2pIH2hWx9NFBXi58CY
         rWzcYkBEHUGMTe45Q+w8heQIMRJo/OP5MKgL8eHJAi2dAmKpvoOaVVS/p6uAufOZQngp
         /sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530183; x=1795134983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9drITw7mklCpATzJbjXqv85fDqlLK/bIxmCKSq+IOc=;
        b=RgPusxtxph5B11ABglnHQAkeK44gNAfMiDd2Dc73/NTdZuJvmaMN4Lv9UChNueSNFH
         Py/g3zkDNPBOVM0J7KbSyKn8H4EfrL2xnSYCv248fp4wBQWY5zALkvybUNIVQfCCNsS+
         RXPCAVCj/fLq+n545B7TBHn0I1QwJAA/Mj8cQ2wZ7t2K+qJN3GLx8DNkH+qfqWS2fw1S
         oBiJY3tep8iG1OEfc1CCpEg/PLNSXgWXhZ3omYEL1QpGSb2F8gqATSoFecMupu96NS6t
         1vfJQ5XMKAp2Nz4bP4A/yV2eQoMskMacOQTCMxk7IpgyNuxISn3Zfk0NDpMjz3rtpb7m
         EbDg==
X-Gm-Message-State: APuU4Z8ErdYW2wObniv8bZBL93DzhJ630lVTR3rMVK7I9KxQe8eDl2Qk
	aVGdwblGLC3zQPsV9/7U3cJzfhkDON8rqBy/dFiQup6x4MubF+LExXEw
X-Gm-Gg: AYBFou3XAEL880TLiYaEsyClRbz0RG+1dySF59foXPoX7k/AfH6DsyvECIkDDjGucKN
	i6/3wTJgAB1e6GCE+ik6w9ukQKaFP2Q0vdW9ItmUi/5miO2PaHfYXZXAS8yNMwbZF4hEzDoGaqx
	6LgxsfvLY6g5Dxpd97vhVfnsxaOd4YHqm0etE1ERcb9t9Df/hEvW8EQYdihXMeWxFr39UGevatb
	zG9T4MmH7dFqQzXtlMho4djtbk5lSj1IjDKCZVI5mmPGjdPovr9OQKwKOlmGMQH+mpFo4AFwbL/
	so9Aip+xuGgBncG7/K6yL9Fop26GAvO5FyaQnsoqX/ochqNmTNJYT4+TmGinQuPywUWIuBNe/Ga
	Jg510QGObt4sfLD0iK0ow9jZf79DFE1HYEFXn98qgZVEzChXGW4lfKstENwBaI4h6EU3dIbM0s5
	vPETdP2e737Q9beEzFoS0pycGR0pVDewRDIMnB0wu2dVnBr+HsHwp+k6SBiHQT+qWFLhn35Nigk
	egCBiXU7cymBkiE5S5sN4inFupiP5blJxoCtMPDm4WM2WdkolscoigOPvs9Ky3ZCRWOoDZ14EVb
	1m99BFyY0/DSLsyIrLr9h/KJR4mYKm5iS7iKroaAe8/+LcoDS+N6FpI8Tu+10AeO9nOkOjihgMn
	c/RgFiHcvvcE6BRFXavZr1NxZ5G9ZbScM/umJUgW+LZRH70Am9OWzduUW9jQ6AQKySqCQFNodyR
	2qq/DfR3SYkYKBX+C3
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4bb55a66467mr17360805e9.25.1794530183276;
        Thu, 12 Nov 2026 16:36:23 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm188421765e9.1.2026.11.12.16.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:22 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 11/24] phy: zte: Add ZTE ZX279128S PCIe PHY driver
Date: Fri, 13 Nov 2026 00:36:22 +0000
Message-ID: <20261113003622.3663361-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101307.3936492-2-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-12-ghahramani.navid@gmail.com> <20261106101307.3936492-2-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163625_308125_3AEFC7DF 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Agustin,

Agustin Santiago wrote:
> On my unit both read back 0 after boot: there seems to be no register
> at 0x1b0/0x1b4 in the top CRM. The vendor kernel writes these two
> values into the port 1 controller's "ctrl" window instead
> (0x09600000 + 0x1b4, then + 0x1b0); with this series those read
> 0x00203c78 / 0x0c46c24a. The link trains anyway (the MT7916 enumerates
> at 2.5 GT/s), so it may only matter for signal margin, but as written
> the writes have no effect.

You are right, thank you. I checked the stock kernel and it maps
0x09600000 for port 1 and writes both values there. My first driver
took that mapping for the top CRM and v2 kept the mistake. The PCIe
series will write them to the port 1 ctrl window.

Best regards,
Navid

