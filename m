Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DFB606B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZ4kLj/w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LL9o7NRn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=; b=LZ4kLj/wWBCoPY
	zVBoh7EWs1S1aPUNVWf8UZZ39en42N9U+zT6rROH7zYO0tWPeFdyDFJQGxWfV/OPJmkiBYKgQGWrc
	2I2udNzvKpXOp+Vz9ji4A3mV+SZADvEXTnsdJB3luKHVqVo53LZy9Zwe6PlI6gXATJpgJBwlfCwJd
	mCKSKXQ3iqycPYNogFNTF9Tvh6TNRYVYz0QuAhEDh1pJX54MoAMNBSvQ8jQ7myBdOd6wfZ0cWzR9Z
	UKiRoWWrpCVbycWbf2lrKBTMr6Uvmm5UQuf4a/ytvglYnq0DP1QXMTL9JJFt4imueHm0QFkx2JDxK
	el0oufmUvhizbpgSHzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIv-0000000BLhh-1mXj;
	Fri, 13 Nov 2026 00:38:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIo-0000000BLeo-0YUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5888955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530280; x=1795135080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=LL9o7NRnqKULafk+zaK3ymyQCgis1wb2oWla7/Lh7NyynCpCAgr8+8JFUgAYr9PVBF
         Y+KVXd3m4oH4QWvfhrqA5N3MMNOXOHPUdVzqCPT1Bqvik5pftCegURyZVR5fdFN9/SmF
         CXe/sEIxgWYNdfrshVetN2etJvlLO3gZyn3RoghS2HOhfvjQC3GHHVau3VB7GAyE7gcM
         SyJdKYxxD25FPylAyszf0fil2XauL9flhfeeC37+csQtQBWZELbYLVFaLVf8Lxg+PToH
         PgS3tzS7BVvumsGcbV5opn/xy3VycgcJ3bSV8bgSKgmITpOVE2ZK4x/zPA79U9EgRtSG
         26eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530280; x=1795135080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJV6PkKyLn8LLaFMN3pT/YFquqSkktNVkI76CPkMC6c=;
        b=2SnXQhuXj3BK4+a3l1aLotb2xT/7exQIL5dsQsWtc+D4j6kmofZeK4CI0F+Het5PmC
         naZ59z8vsEI7vtvZ5qcVoJM5MBRZ2JySelqWQTGsMBj7JeAbvvNdy98dqB8oLoxibWFP
         BpxIGi0yzvBf9lrokM7B0frtF+chU4kXZtiG5QWZGzqzUD5p0QBl95Bh3jO/PSq8lDaY
         HYDnuXTChc816KRhiiMMxnq9ovuRlmc5YpZeG/KWoxk4yj+NT2CjTMuLcUd7olZT0h8r
         OdU7T6AgpCGPb2ZGpjNTNT0AE0QH4SuQhlBgchAUf5GBRoRcDhIUOx4DRo5nRCGu6e2h
         FKgQ==
X-Gm-Message-State: APuU4Z/vUa8MVseUCRzi3Gycmn/EcN5D5IRMVt5m8kBeurAIph8ts9aj
	Fludf6JTnwrDwNz7SBI6JJ8gFUvWGcJfooeM565WaL4SoXxvJKTji71P
X-Gm-Gg: AYBFou39qqnDdCJmxC7D6NDuyg+T/rWAzNRTgmHKwAP5qDAMzCmjyK+KbPzeDx9mhTO
	YBYEZeF7FGFVx0n2etAwvypfh4w/BmxlnTng5im9+CQGL+qtuJhdX4Znq/ICZTwPm1I9fkWjuaS
	0y4C0kzmWMS10cCEzMI9rJ7wt3Jg2lLv/OKuJanJ5DJXRjCy6jQ+2A1xKCqzL0zJVjs3qGmf9DZ
	oAZFaGf6B9082aDuWDGHWCqF6LQEsN53kd8F1HdtnRfPpPWaqk8ssV+ctimsSGaOJrznTEkUUr6
	D4BWCG4dWRuLDFqRcybEm6YbG2+eLzEqFE97+Tt/0i8O2OLYQUrn944m40kzzJEVxu4BdHSaALV
	UKlOlCEAfS7VEqYraorXeJLQp3CziFgytQBAgbSv3y3SMviOMxWtVkG+nnfbwYQmi9r9C7k0xmf
	Z2KaX0+APy6SUlOxlmTD0rLjej4lEO4uEmAmjFT6qj9x8MMHPCMwC4xKpsuYyhCAqk9I8JZEmqB
	84BIhFjCFngaOKbZyUllm46ewL7jHVPDcLw67N36RUSO6ou2wV5ImhxtW+aO1IsIoZ5AOlLPMir
	H7F84Xr+vWWcKAB9kf1sO4inzrt0DDMza4x9gR6IcPgW7zQZgvJYlzmUy3X/SheedWCAxpwQSSb
	mih9qVjHMLRn1OKrKoCmATfisQlHy3VokOIrIMR/PzpIi3sKOeKHQoJrhz9rIwkL4lWiWDqYUPf
	MOJB+fyx9ulb++aUq9
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr12042895e9.23.1794530280470;
        Thu, 12 Nov 2026 16:38:00 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1868483f8f.7.2026.11.12.16.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:59 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Fri, 13 Nov 2026 00:37:57 +0000
Message-ID: <20261113003757.3669262-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214830.GA1267186-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-18-ghahramani.navid@gmail.com> <20261027214830.GA1267186-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163802_184969_C86DA27A 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Rob,

Rob Herring wrote:
> Use the ethernet-switch.yaml schema here.

> ethernet-port is preferred for new bindings.

Thanks, I will do both in the switch binding for the netdev series.

Best regards,
Navid

